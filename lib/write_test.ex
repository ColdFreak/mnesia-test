defmodule WriteTest do
  use Database
  use Amnesia
  def add_message do
    Amnesia.transaction do
      john     = %User{name: "John",    email: "john@example.com"}    |> User.write
      # richard  = %User{name: "Richard", email: "richard@example.com"} |> User.write
      # linus    = %User{name: "Linus",   email: "linus@example.com"}   |> User.write

      john |> User.add_message("""
      john's first message
      """)

#      john |> User.add_message("""
#      He who refuses to do arithmetic is doomed to talk nonsense."
#      """)
#
#      richard |> User.add_message("""
#      It's difficult to be rigorous about whether a machine really 'knows',
#      'thinks', etc., because we're hard put to define these things. We understand
#      human mental processes only slightly better than a fish understands swimming.
#      """)
#
#      richard |> User.add_message("""
#      I am skeptical of the claim that voluntarily pedophilia harms children. The
#      arguments that it causes harm seem to be based on cases which aren't
#      voluntary, which are then stretched by parents who are horrified by the idea
#      that their little baby is maturing.
#      """)
#
#      linus |> User.add_message("""
#      Portability is for people who cannot write new programs.
#      """)
#
#      linus |> User.add_message("""
#      Really, I'm not out to destroy Microsoft. That will just be a completely
#      unintentional side effect.
#      """)
#
#      linus |> User.add_message("""
#      Modern PCs are horrible. ACPI is a complete design disaster in every way. But
#      we're kind of stuck with it. If any Intel people are listening to this and
#      you had anything to do with ACPI, shoot yourself now, before you reproduce.
#      """)
    end
  end
end
