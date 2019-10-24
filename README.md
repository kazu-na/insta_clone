【ポテパンサブ課題】instagram のクローンを作ってみましょう！
[課題URL](https://kazu-na-insta-clone-app.herokuapp.com/)
adminユーザーへログインするためには下項を入力してください。
example@railstutorial.org
password: foobar

目標物の確認
  △Facebook を利用したログインができる
   ※問題点あり(下記に詳細)
  ○ログイン後に写真をアップロードすることができる
  ○他のユーザーをフォローすることができる
  ○ログイン後はトップページにフォローしているユーザーの写真が時系列順に表示される
  ○ユーザーの個別ページでは、そのユーザーのアップロードした画像のみ一覧で表示される
  ×通知を受信すると通知一覧ページで確認することができる
  ×検索フォームから自由記述で写真を検索することができる

  トップページ（ログイン前）
  ○  ランディングページを表示する
  ○  Facebookログインのリンクがある（後述）

  ヘッダー（共通）
  ○  トップページへのリンク
  △  検索フォーム
     ※表示はしていますが機能はしていない状態です。
  △  通知（あり、なし）
     ※表示はしていますが機能はしていない状態です。
  ○  自分のページへのリンク
  ○  titleを各ページごとにユニークに設定する
      Rails tutorialの学びを活かす

  フッター（共通）
  ○  写真アップロード画面へのリンクがある

  トップページ（ログイン後）
  ○  フォローしているユーザーの画像が一覧で表示される
  ×    写真をお気に入りに入れることができる
  △    写真にコメントを記入することができる
       ※問題点あり(下記に詳細)

  ユーザー個別ページ
  ○  ヘッダー（共通）が表示される
  ○  プロフィール写真が表示される
    自分のページの場合
  ○    プロフィール編集ページへのリンクがある
    自分以外のページの場合
      フォローしていない場合
  ○      フォローボタンが表示される
  ○      フォローボタンをクリックすると、該当ユーザーをフォローし、ボタンのラベルを「フォロー中」に更新する
      フォローしている場合
  ○      フォロー解除ボタンが表示される
  ○      フォロー解除ボタンをクリックすると、該当ユーザーのフォローを解除し、ボタンのラベルを「フォローする」に更新する
  ○  これまでに登録した写真の件数が表示される
  ○  フォロワーの数が表示される
  ○  フォローしているユーザーの数が表示される
  ○  自己紹介が表示される
  △  投稿した写真が横３列で表示される
     ※私の環境では3列で表示されていますが環境によると思います。
  △  写真をクリックするとモーダルで写真とコメントが表示される
     ※問題点あり(下記に詳細)

  プロフィール編集ページ
  ○  パスワード変更ページへのリンクがある
    下記のプロフィールを編集することができる。（※は必須入力）
      公開情報
  ○      名前（※）
  ○      ユーザーネーム（※）
  ○      ウェブサイト
  ○      自己紹介
      非公開情報
  ○      メールアドレス
  ○      電話番号
  ○      性別
  ×  アカウントの削除ボタンがあり、クリックすると自分のデータが全て削除される

  パスワード変更ページ
  △  現在のパスワード、新しいパスワード、新しいパスワードの確認入力欄があり、現在のパスワードが正しく、
     新しいパスワードと新しいパスワードの入力欄が一致する場合にパスワードが 更新される。
     ※新しいパスワード、新しいパスワードの確認入力欄のみでの実装状態です。

  写真個別ページ
  ○  ユーザーがアップロードした写真が表示される
  △  ユーザーが記入したコメントが一覧で表示される
     ※問題点あり(下記に詳細)
  △  コメントの入力欄がある
     ※問題点あり(下記に詳細)

  写真アップロード画面
  ○  写真選択ボタンがある
  ○    写真アップロードボタンを押すと、ファイルの選択ダイアログが表示され、写真が選択できる
  ○    ファイル選択ダイアログでは、png と jpeg しか選択できない
    写真アップロードボタンがある
  ○    写真アップロードボタンを押すと選択した写真がアップロードされる
  ○    写真は正方形に整形される
  △    処理完了後、写真個別ページへリダイレクトする

  Facebook ログイン
  ×  Facebook でログイン後、ユーザーが存在しなければユーザー登録画面にリダイレクトする
     ※問題点あり(下記に詳細)

  ユーザー登録画面
  ○  フルネーム、ユーザーネーム、パスワードの入力欄がある
  ×  利用規約ページへのリンクがある
  ○  登録するボタンをクリックすると、ユーザーが作成され、自分のユーザー個別ページにリダイレクトする




自分が苦労した点
・Facebook を利用したログインができる
  Railsチュートリアルを完走後にFacebookのログイン認証を実装しようとしdeviseのGemを入れたところ
  エラーが続出してしまい、諦めて前回のコミット地点まで戻りdevise無しで実装しようと試みるも
  認証が完了後のタイミングくらいで"We're sorry, but something went wrong."と表示されてしまい
  これを解決できずに一旦保留状態になっています。

・コメントの入力欄がある
  (https://qiita.com/miyazaki_yusuke/items/dd1c053851a042cae893)と(https://qiita.com/goppy001/items/755105c8dd6d32bcb506)
  を参考に実装にチャレンジしてみました。
  とりあえず殆どコピーしたもののMicropostのshowページを活かせれていない状態です(app/views/micropost/_micropost.html.erbがあるのでそもそも必要ないのでしょうか)
  それとapp/views/comments/_form.html.erbでmicropostのidが見つけられず？実装ができていない状態になっています。

・写真をクリックするとモーダルで写真とコメントが表示される
  ユーザーのプロフィールページで実装しようと試みるも、
  上記のコメント実装時の問題と重複しているような気がしますが、個別のidが取得できていないのか一つの写真をクリックすると
  投稿した全ての写真のモーダルが表示されてしまっている状態です。

  また、ユーザーのプロフィール編集ページへのボタンもモーダルで実装したのですが、動作はうまくいくものの
  ブラウザで戻ったさいにモーダルが表示されたままになってしまっています。(戻った時に自動でリロードすれば良さそうな気がしますが実装方法が分からず)
  それと、モーダルを表示してる状態でブラウザの戻る処理をした場合に、求める動作はモーダルを閉じるのみにしたいが実際は前のページまで戻ってしまいます。
  この辺の問題はググると解決の記事が出てきましたがいまいちやり方が分からず保留になっています。

苦労した点というよりもただの問題点になってしまっていますが……。

学んだ点
  今回Railsチュートリアル二週目を兼ねてインスタのクローンアプリを作ってみました。
  一週目では自分に落とし込めていなかった知識も沢山あり、それらが理解できる瞬間もあり嬉しかったです。
  しかし今回もまだコピペでの実装が殆どで、自分でコードを書く力が身に付けられていないなと思います。
  なのでエラーへの対処やRailsチュートリアル外の実装項目のテストコードなのが全く書けていない状態です。
  本課題からはRspecでのテストということで、やはりコードを書ける力を身に付けるのが課題となりそうです。

自慢したい・相談したい点
  自分が苦労した点と重複してる点もありますが下記が相談したい点です。よろしくお願いいたします。

  ・test/integration/users_profile_test.rb の test "profile display" でエラーになってしまう。

  ・Post投稿を validates :image, presence: true にすると下記のエラーが出てしまう。
    ・MicropostTest
      test "should be valid"
    ・UserTest
      test "associated microposts should be destroyed"

  ・Facebookのログイン認証で"We're sorry, but something went wrong."と表示されてしまう。

  ・コメント実装でmicropostのidでエラーが出てしまう。

  ・/views/users/show.html.erb 内のmodal表示がうまくいかない。
