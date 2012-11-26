module PagesHelper
  def search_page?
    array1 = request.fullpath.split('/')
    array2 = request.fullpath.split('?')
    array1.at(1) == 'search' || array2.at(0) == '/search'
  end
end
