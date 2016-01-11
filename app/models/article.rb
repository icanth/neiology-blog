class Article < ActiveRecord::Base
#serialize :converavatars, Array
#   has_many :converavatars
	has_attached_file :converimage, :styles => { :medium => "300x300>",:thumb => "100x100>" }
	
	validates_attachment 	:converimage, 
				:presence => true,
				:content_type => { :content_type => /\Aimage\/.*\Z/ },
				:size => { :less_than => 1.megabyte }


	def self.search(query, page, page_size)
	  query = query ? query.strip : nil
	  if query && !query.empty? then
		query = "%#{query}%"		
		where(gen_search_matchs_condition(query)).page(page).per(page_size).order(id: :desc)
	  else 
		page(page).per(page_size).order(id: :desc)
	  end	  	
	end

private
	def self.gen_search_matchs_condition(query)
		match_condition = arel_table[:title].matches(query)
		match_keys = [
			:page_refer,
			:author,
			:translate,
			:editor,
			:press,
			:print,
			:print_date,
			:journal,
			:inner_flag,
			:bindery,
			:attr,
			:remark,
			:text,
			:old_text
		].each{|key|
			match_condition = match_condition.or(arel_table[key].matches(query))
		}
		return match_condition
	end

end
