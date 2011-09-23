class DotWriter

  def self.write(board, filename)
    g = Graph.new(board)
    IO.popen("dot -Tps -o #{filename}", 'r+') do |dot|
      dot.write(g.to_dot)
    end
  end

end
