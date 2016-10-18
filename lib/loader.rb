module Loader
  BACKUP_NAME = 'data'
  PATH = './data/'
  EXTENSION = '.yml'

  def load(file_name = BACKUP_NAME)
    file_name += EXTENSION.to_s
    pull_data(file_name) if File.exist?(PATH + file_name)
  end

  def aquire_data
    {
      authors: @authors,
      books: @books,
      readers: @readers,
      orders: @orders
    }
  end

  def pull_data(filename)
    file = File.open(PATH + filename)
    data = YAML.load(file)
    @authors = data[:authors]
    @books = data[:books]
    @readers = data[:readers]
    @orders = data[:orders]
    file.close
  end

  def save(file_name = BACKUP_NAME)
    full_path = PATH.to_s + file_name.to_s + EXTENSION
    data = YAML.dump(aquire_data)
    File.new(full_path, 'w') unless File.exist?(full_path)
    File.write(full_path, data)
  end
end
