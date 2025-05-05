Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBs9P-000525-19
	for mharc-qemu-rust@gnu.org; Mon, 05 May 2025 05:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uBs9J-0004xZ-Uq
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:30:10 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uBs9G-0001lq-VG
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:30:09 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5f4b7211badso6019069a12.2
 for <qemu-rust@nongnu.org>; Mon, 05 May 2025 02:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746437403; x=1747042203; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TnQzmi1Xy7uDy5QqPZ5mjja3cTUskZY+1A3H4oT6BXU=;
 b=eb4nWWzqTFqdtDMz0HiXA7w1QNkOgttA+pzS/tSu9gkrUA9l8tBYWEK5Why2qa0gQ9
 R8iprvI279qQg2+3x7sOWOskicrgbE9RkCan5Grq7nVtVR6mP2z431vbh9omoCt+sUw5
 k1f8Eb/7fjZj2cUdQ3/evCeBkFaxEApOoGQepIWt4nDwVnL5wWvxZzBdItpUF9fo32/Y
 TgGmKSchRPPTsSaCWqwW+73i0qwNx6G1lNteRhfjhcV7TrDc3OVEbV+Udxhjax08c1jf
 Hue3idt5JBhgpxtW4b9nXT7u7oMr/TeeAtQ8oeBJLmWmBtX02MnSXgDmoty10M8bh3aD
 aLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746437403; x=1747042203;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TnQzmi1Xy7uDy5QqPZ5mjja3cTUskZY+1A3H4oT6BXU=;
 b=U4zzFUcNBlg0Z6jwkr3FI7NtaQ5byO1r1BQpIQoylidgqUl0hfyxUbWorWNFMoY8h6
 ZipiHfdVDQ6wEgHLpJ0sBic6sfY+5wmHr2jSXIrdwr0D+8G/GEd6wBWOdO4Z3E779ryG
 TenekorBcfuQdnGQW/gRF4v8UteQBu3qRcW2tkbVhotWLQPCKQmrdJtXu6Ay88kGOgNI
 Hpnib6VOv1ihxQse7KZGuckV9pe/FDjG9zIZoKn3g1KLafgVra/yrawcDuAguQmpNDS3
 0m4NfxND4DRh/W/NErzjpAxHgqWe9ZzlitfXvwJiDLFBn1ewREgQ7uxST7i6ahGsLZgS
 vyWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQA3tcSrU4Rjtz4qdRxFUYpEBNLWZSD4apK3Oflr19eiCZ4mmmAXGDlFgp+kwXBalSfJuRi+VQ/3U=@nongnu.org
X-Gm-Message-State: AOJu0Yxoc0j79BZyNjYPKnLOA9DJcV3COCt1KL7V89/JqWEJ8GJqX/vn
 eztn14n/RdIq0pQVI8jRU8kNe9U92h0yTK2yQ6Xk+tqbUNFMP267nl8UrkaehqWP4C3/fd4Obed
 nM6BQCklYzJ6Yc8cL0bqX+d7QEHd4eNcHJTGHWg==
X-Gm-Gg: ASbGncvrVCfLM2NkZKgu1rXEEMWF4TnDKcCCsJ1RoGxBc7q7l9jPLNHv0pXnsZTlS+8
 9yss7/9pa5gWTWHp7g3oACsWAZIVlmGHkGMAOCxtPSL8lBZ4BsgQPsBFYA8ESes4VNPXQrtesCn
 BIIQi5pEMZM8Csknk/0FzVCBJYxmeEwP4=
X-Google-Smtp-Source: AGHT+IHNaAsVgBa0jQgcIiXmicHpOCw28Zcz1LPA7CJ4QgxBuLEMzioanb9lohE4TrkfBh5J4oaqWyHl5XmJRQRQxGU=
X-Received: by 2002:a05:6402:354e:b0:5f4:5dfa:995f with SMTP id
 4fb4d7f45d1cf-5faa7f478e1mr6763309a12.13.1746437403277; Mon, 05 May 2025
 02:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250505090438.24992-1-pbonzini@redhat.com>
 <20250505090438.24992-3-pbonzini@redhat.com>
In-Reply-To: <20250505090438.24992-3-pbonzini@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 5 May 2025 12:29:37 +0300
X-Gm-Features: ATxdqUGdO9dCWT8h3WNuNL-aPqxiTvfwXUVaBdQrbDyqZq8PPkK_941xQUsq0Tg
Message-ID: <CAAjaMXZovuEzZpenUbFpy3QtFnE5NR-KgXthAgGvQRs3ae-Tew@mail.gmail.com>
Subject: Re: [PATCH 02/11] meson, cargo: require Rust 1.77.0
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 05 May 2025 09:30:11 -0000

On Mon, May 5, 2025 at 12:04=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build      | 6 +++---
>  rust/Cargo.toml  | 2 +-
>  rust/clippy.toml | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 8ae70dbe45a..e77da3f9b75 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -94,12 +94,12 @@ have_rust =3D have_rust and add_languages('rust', nat=
ive: true,
>      required: get_option('rust').disable_auto_if(not have_system))
>  if have_rust
>    rustc =3D meson.get_compiler('rust')
> -  if rustc.version().version_compare('<1.63.0')
> +  if rustc.version().version_compare('<1.77.0')
>      if get_option('rust').enabled()
> -      error('rustc version ' + rustc.version() + ' is unsupported. Pleas=
e upgrade to at least 1.63.0')
> +      error('rustc version ' + rustc.version() + ' is unsupported. Pleas=
e upgrade to at least 1.77.0')
>      else
>        warning('rustc version ' + rustc.version() + ' is unsupported, dis=
abling Rust compilation.')
> -      message('Please upgrade to at least 1.63.0 to use Rust.')
> +      message('Please upgrade to at least 1.77.0 to use Rust.')
>        have_rust =3D false
>      endif
>    endif
> diff --git a/rust/Cargo.toml b/rust/Cargo.toml
> index 5ace47c69be..eda7980b31a 100644
> --- a/rust/Cargo.toml
> +++ b/rust/Cargo.toml
> @@ -12,7 +12,7 @@ edition =3D "2021"
>  homepage =3D "https://www.qemu.org"
>  license =3D "GPL-2.0-or-later"
>  repository =3D "https://gitlab.com/qemu-project/qemu/"
> -rust-version =3D "1.63.0"
> +rust-version =3D "1.77.0"
>
>  [workspace.lints.rust]
>  unexpected_cfgs =3D { level =3D "deny", check-cfg =3D [
> diff --git a/rust/clippy.toml b/rust/clippy.toml
> index 5d190f91dec..933e46a2ffb 100644
> --- a/rust/clippy.toml
> +++ b/rust/clippy.toml
> @@ -1,2 +1,2 @@
>  doc-valid-idents =3D ["PrimeCell", ".."]
> -msrv =3D "1.63.0"
> +msrv =3D "1.77.0"
> --
> 2.49.0
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

