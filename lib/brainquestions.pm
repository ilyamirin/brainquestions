package brainquestions;
use Dancer ':syntax';

use MongoDB;
use MongoDB::OID;
use Dancer::Cookies;

our $VERSION = '0.1';

my $client = MongoDB::MongoClient->new;
my $database  = $client->get_database( 'brain' );
my $questions = $database->get_collection( 'questions' );
my $users = $database->get_collection( 'users' );

get '/' => sub {
	my $user_id = cookie( "user_id" ) ? cookie( "user_id" ) : $users->insert({})->value;
	cookie( "user_id", $user_id ) unless cookie( "user_id" );

	info 'User with id ' . $user_id . ' has logged in';

	my $user = $users->find_one({ _id => MongoDB::OID->new( $user_id ) });

	my $questions_count = $questions->count;	
	my $question = $questions->find->limit(-1)->skip(int rand $questions_count )->next;
	
	$questions->find->limit(-1)->skip(int rand $questions_count )->next while $question->{ _id } ~~ $user->{ answeredQuestions };

	info 'Question with id has been selected: ' . $question->{ _id };
    
    template 'index', { question => $question };
};

get '/do/not/show/answer/:question_id/to/user' => sub {
	my $user_id = cookie( "user_id" ) ? cookie( "user_id" ) : $users->insert({})->value;
	cookie( "user_id", $user_id ) unless cookie( "user_id" );

	info 'User with id ' . $user_id . ' has logged in';

	my $question_id = params->{ question_id };

	$users->update({ _id => MongoDB::OID->new( $user_id ) }, { '$addToSet' => { answeredQuestions => $question_id } } );
	
	info 'User ' . $user_id .  ' saw the answer for question ' . $question_id;
    
    return { status => 'OK' };
};

true;
