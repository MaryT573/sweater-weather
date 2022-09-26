require 'rails_helper'

RSpec.describe Book do
    it 'has attributes of returned books' do
        data = {:key=>"/works/OL4930574W",
            :type=>"work",
            :seed=>
             ["/books/OL17665953M",
              "/books/OL17801719M",
              "/books/OL2663740M",
              "/works/OL4930574W",
              "/subjects/government_executives",
              "/subjects/training_of",
              "/subjects/western_executive_seminar_center_(denver_colo.)",
              "/subjects/place:united_states",
              "/authors/OL1059069A"],
            :title=>"Relocation of Western Executive Seminar Center from Denver to Grand Junction, CO",
            :title_suggest=>"Relocation of Western Executive Seminar Center from Denver to Grand Junction, CO",
            :edition_count=>3,
            :edition_key=>["OL17665953M", "OL17801719M", "OL2663740M"],
            :publish_date=>["1984"],
            :publish_year=>[1984],
            :first_publish_year=>1984,
            :number_of_pages_median=>100,
            :lccn=>["85601140"],
            :publish_place=>["Washington"],
            :contributor=>["United States. Congress. House. Committee on Post Office and Civil Service. Subcommittee on Civil Service."],
            :lcc=>["KF-0027.00000000.G6678 1984g"],
            :ddc=>["353.0740978883"],
            :last_modified_i=>1604445783,
            :ebook_count_i=>0,
            :ebook_access=>"no_ebook",
            :has_fulltext=>false,
            :public_scan_b=>false,
            :publisher=>["U.S. G.P.O."],
            :language=>["eng"],
            :author_key=>["OL1059069A"],
            :author_name=>["United States. Congress. House. Committee on Government Operations. Manpower and Housing Subcommittee."],
            :author_alternative_name=>
             ["United States. Congress. House. Committee on Government Operations. Manpower and Housing Subcommittee",
              "United States. Congress. House. Committee on Government Operations Manpower and Housing Subcommittee."],
            :place=>["United States"],
            :subject=>["Government executives", "Training of", "Western Executive Seminar Center (Denver, Colo.)"],
            :publisher_facet=>["U.S. G.P.O."],
            :place_key=>["united_states"],
            :subject_facet=>["Government executives", "Training of", "Western Executive Seminar Center (Denver, Colo.)"],
            :_version_=>1735672853767913472,
            :place_facet=>["United States"],
            :lcc_sort=>"KF-0027.00000000.G6678 1984g",
            :author_facet=>["OL1059069A United States. Congress. House. Committee on Government Operations. Manpower and Housing Subcommittee."],
            :subject_key=>["government_executives", "training_of", "western_executive_seminar_center_(denver_colo.)"],
            :ddc_sort=>"353.0740978883"}
        

        book = Book.new(data)
         
        expect(book).to be_a Book
        expect(book.isbn).to eq(data[:edition_key])
        expect(book.isbn).to be_a(Array)
        expect(book.publisher).to eq(data[:contributor])
        expect(book.publisher).to be_a(Array)
        expect(book.title).to eq(data[:title])
        expect(book.title).to be_a(String)
    end
end