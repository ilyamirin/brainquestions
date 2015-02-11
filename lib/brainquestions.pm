package brainquestions;
use Dancer ':syntax';

use boolean;
use MongoDB;
use MongoDB::OID;

our $VERSION = '0.1';

my $client = MongoDB::MongoClient->new;
my $database  = $client->get_database( 'braindo' );
my $questions = $database->get_collection( 'questions' );

get '/' => sub {
	my $questions_count = $questions->count({isValid => true});	
    info 'count= ' . $questions_count;
	my $question = $questions->
        find({isValid => true})->
        limit(-1)->
        skip(int rand $questions_count )->
        next;
    $question->{authorName} = 'Некто' unless $question->{authorName};
	template 'index', { question => $question };
};

true;
