module Resource
    def connection(routes)
      if routes.nil?
        puts "No route matches for #{self}"
        return
      end
  
      loop do
        print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
        verb = gets.chomp
        break if verb == 'q'
  
        action = nil
  
        if verb == 'GET'
          print 'Choose action (index/show) / q to exit: '
          action = gets.chomp
          break if action == 'q'
        end
  
  
        action.nil? ? routes[verb].call : routes[verb][action].call
      end
    end
  end
  
  class PostsController
    extend Resource
  
    def initialize
      # Добавил в массив текст для проверки работоспособности
      @posts = [
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate",
        "One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.",
        "A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine."
    ]
    end
  
    def index
      @posts.each_with_index do |posts, index|
      puts "Индекс поста: #{index}"
      puts "Текст поста: #{posts}"
      end
    end
  
    def show
      puts "Введите индекс поста"
      input = gets.to_i
      if input < @posts.length
        puts @posts[input]
      else
        puts "Поста с таким индексом не существует!" 
      end  
    end
  
    def create
      puts "Введите текст поста"
      input_tekst = gets.to_s 
      @posts.push(input_tekst)
      last_post_id = @posts.length
      puts "Пост создан"
      puts "Индекс поста: #{last_post_id -1}"
      puts "Текст поста: #{@posts[last_post_id -1]}"
    end
  
    def update
      puts "Введите индекс поста"
      input = gets.to_i
      if input < @posts.length
        puts "Введите новый текст поста"
        input_tekst = gets.to_s
        @posts[input,1] = input_tekst
        puts "Пост обновлен!"
        puts "Индекс поста: #{input}"
        puts "Новый текст поста: #{@posts[input]}"
      else
        puts "С таким индексом поста не существует!"  
      end  
    end
  
    def destroy
      puts "Для удаления поста введите индекс поста"
      input = gets.to_i
      if input < @posts.length
        @posts.delete_at(input)
        puts "Пост с индексом #{input} удален!"
      else
        puts "С таким индексом поста не существует!" 
      end  
    end
  end
  
  class Router
    def initialize
      @routes = {}
    end
  
    def init
      resources(PostsController, 'posts')
  
      loop do
        print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
        choise = gets.chomp
  
        PostsController.connection(@routes['posts']) if choise == '1'
        break if choise == 'q'
      end
  
      puts 'Good bye!'
    end
  
    def resources(klass, keyword)
      controller = klass.new
      @routes[keyword] = {
        'GET' => {
          'index' => controller.method(:index),
          'show' => controller.method(:show)
        },
        'POST' => controller.method(:create),
        'PUT' => controller.method(:update),
        'DELETE' => controller.method(:destroy)
      }
    end
  end
 
  router = Router.new
  
  router.init