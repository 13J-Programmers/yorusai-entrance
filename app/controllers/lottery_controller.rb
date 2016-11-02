class LotteryController < ApplicationController
  def index
  end

  def student
    target = Student.where(attended: true, elected: false)
    @winner = target.offset(rand(target.count)).first
    if @winner.nil?
      flash.now[:danger] = "抽選対象がありません。入場処理を行ってください"
    else
      @winner.elected = true;
      @winner.elected_at = DateTime.current()
      @winner.save
    end
  end

  def classroom
    target = Classroom.where(elected: false)
    @winner = target.offset(rand(target.count)).first
    if @winner.nil?
      flash.now[:danger] = "抽選対象がありません"
    else
      @winner.elected = true;
      @winner.save
    end
  end

  def result
    @winners = Student.where(elected: true).order(:elected_at).pluck(:student_id)
    @classes = Classroom.where(elected: true).order(:updated_at).pluck(:class_id)
  end
end
