package brainquestions;
use Dancer ':syntax';

use MongoDB;

our $VERSION = '0.1';

my $client = MongoDB::MongoClient->new;
my $database  = $client->get_database( 'brain' );
my $questions = $database->get_collection( 'questions' );

get '/' => sub {
	my $questions_count = $questions->count;
	my $question = $questions->find->limit(-1)->skip(int rand $questions_count )->next;
	info 'Question with id has been selected: ' . $question->{ _id };
    template 'index', { question => $question };
};

true;
