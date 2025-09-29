Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A31CAC5B0
	for <qemu-rust@archiver.kernel.org>; Mon, 29 Sep 2025 13:02:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3DVv-0002af-UT; Mon, 29 Sep 2025 09:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1v39jK-0002Zr-96
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 04:59:35 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1v39j3-00035N-2V
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 04:59:30 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-b5579235200so3127070a12.3
 for <qemu-rust@nongnu.org>; Mon, 29 Sep 2025 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759136351; x=1759741151; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mVIKVttdwo2WJjpBS6chzzgYuqQUjFblJfEzOM3LzhY=;
 b=hIofaeHamBR0JG5CayjHY69MLyLrxJ7rPsHACWa18n2NU2me3Y9yjmKmwt1/aZzU84
 SMOxOedbVNJ4aByLFa4R3TWOy30LS3EDNiqUeaoAlfgQncBRn27Ggyof5xKIcDaWhPjh
 T/IzGdQTqciYLszsW+IzE18l0bVUwTmIDiC3S8IMnDfgrgFXX2XZ/GsqgxCVBlOU4e17
 GtfjA09+FqjuMmouGZOhSNdt7usdwFBFdnF5w7z0qZiRj+UoxUT3lP6mce0UuIyhm6yT
 ftoVITUSAR12KJhTt1mI3iGjzqN1csNVTPxneFBFayVZad7yoBFpdAGsODHG0cr6jkpG
 WiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759136351; x=1759741151;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mVIKVttdwo2WJjpBS6chzzgYuqQUjFblJfEzOM3LzhY=;
 b=Kaq5pXL7Z8+pkm4FEqkO+omE6ilEsZ7k1gfKhOIRL0i66U8F7FBzzPo5lGHOdUwIV7
 aqGGqCf6k3y4GKNoMe5Gf0OaJyq3Q9OuK6xpmmkVGLawDsrl3Si0bc+7B7mIzgkPy1qF
 GJ31tHs188pYcliKpaUoO/zz94coe2Lk2sqp9dWDBTb/Na3xZiW9OxK7yRjEMgTeYTv4
 PFn5oAPFjvFOW74BRVJBILNDerC/RyU7TKYJbsh83XlH5F6xV77aNMwsl/Xu/BYVG1xJ
 STlFqp8zGuJnouBm+wfeVP+N22UhjhM2w6M+4MS5p767a/8THWfzug0RlRF0hHApYIcR
 muhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI5dvAsvZwk+u0zu2XwdxZ/lXQnZ5ZIxqPWIE1Kw7VBhYIRXsFN9SK9SfxcIIYINWgbk5dy4W7VMo=@nongnu.org
X-Gm-Message-State: AOJu0Yw1b9Yz5NY8w13a7uN7nfyqfPsLQGLF/9LOqB7w31PnKqOmbaOi
 nsf14+Etc5u8rQUNC+i+qPv/jHfWqvJs2J5gwIa/u5sEYnlPghiM1uxVsrI0Hq6rMh3pG2CeM6Y
 V57wqKjIUFN9Jk5DFwGnfa5mhe0f7qyGt8RVu
X-Gm-Gg: ASbGncvqlUk/6KZ8I/EZEJGRGALtzDXQuWHneqR/RSMs9gixAKuHRRCXhGtKTWsScEx
 eMXQI7G+VuuOIytGhhtsFpNO54/p7/E2irhYkCvb1O0lV6Ekg8CEf0lIS8V324KqGO0uAdBr8uH
 17fufMpYb7tuftl0EFDgIOerBYaSRIbvWl3yEHJBj4QwOE024PE+MH4svv2pcxbT3CTRt2Cq2/R
 xJbMHew1KtmTRDGgv4WE7KjxjwItBbRvBxqf1rwRTPcSubU
X-Google-Smtp-Source: AGHT+IEzAb3M194q8bgWISidiHw+fODokV0jUqcMMwE6nKrSRsBB/VCxjJL9bvI46v2GKmrJHId1qrAcB+7AqL9Uu3s=
X-Received: by 2002:a17:90a:e710:b0:329:f630:6c3 with SMTP id
 98e67ed59e1d1-3342a2b94d9mr18273481a91.20.1759136351301; Mon, 29 Sep 2025
 01:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250924120426.2158655-1-marcandre.lureau@redhat.com>
 <20250924120426.2158655-27-marcandre.lureau@redhat.com>
In-Reply-To: <20250924120426.2158655-27-marcandre.lureau@redhat.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Mon, 29 Sep 2025 17:58:59 +0900
X-Gm-Features: AS18NWD8bzHZANkNwNuifw9qEhi8Hr9-8_FG7YXl9JVdMsK2umDJxPDbu4cpqHM
Message-ID: <CAEDrbUbHqK3pq6WS+ViKdoh-aTX0QwaJ_RPOv=bxE=hvSVUYFA@mail.gmail.com>
Subject: Re: [PATCH v2 26/27] build-sys: pass -fvisibility=default for wasm
 bindgen
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@freebsd.org>, 
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Warner Losh <imp@bsdimp.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ed Maste <emaste@freebsd.org>,
 devel@lists.libvirt.org, 
 qemu-rust@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000054b31e063fecd973"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Sep 2025 09:01:57 -0400
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

--00000000000054b31e063fecd973
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Otherwise, no functions are generated:
> https://github.com/rust-lang/rust-bindgen/issues/2989
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  meson.build                    | 4 ++++
>  rust/bql/meson.build           | 1 +
>  rust/chardev/meson.build       | 1 +
>  rust/hw/char/pl011/meson.build | 1 +
>  rust/hw/core/meson.build       | 1 +
>  rust/migration/meson.build     | 3 ++-
>  rust/qom/meson.build           | 1 +
>  rust/system/meson.build        | 1 +
>  rust/util/meson.build          | 1 +
>  9 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index 2f134c9e75..cd2b5fa863 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -4255,6 +4255,10 @@ if have_rust
>    else
>      bindgen_args_common +=3D ['--merge-extern-blocks']
>    endif
> +  bindgen_c_args =3D []
> +  if host_arch =3D=3D 'wasm32'
> +    bindgen_c_args +=3D ['-fvisibility=3Ddefault']
> +  endif
>    subdir('rust')
>  endif
>
> diff --git a/rust/bql/meson.build b/rust/bql/meson.build
> index f369209dfd..d020a519bf 100644
> --- a/rust/bql/meson.build
> +++ b/rust/bql/meson.build
> @@ -21,6 +21,7 @@ _bql_bindings_inc_rs =3D rust.bindgen(
>    include_directories: bindings_incdir,
>    bindgen_version: ['>=3D0.60.0'],
>    args: bindgen_args_common,
> +  c_args: bindgen_c_args,
>  )
>
>  _bql_rs =3D static_library(
> diff --git a/rust/chardev/meson.build b/rust/chardev/meson.build
> index 370895c111..e7ce02b3bc 100644
> --- a/rust/chardev/meson.build
> +++ b/rust/chardev/meson.build
> @@ -20,6 +20,7 @@ _chardev_bindings_inc_rs =3D rust.bindgen(
>    include_directories: bindings_incdir,
>    bindgen_version: ['>=3D0.60.0'],
>    args: bindgen_args_common + _chardev_bindgen_args,
> +  c_args: bindgen_c_args,
>  )
>
>  _chardev_rs =3D static_library(
> diff --git a/rust/hw/char/pl011/meson.build
b/rust/hw/char/pl011/meson.build
> index ffdc8af53f..a33f32906e 100644
> --- a/rust/hw/char/pl011/meson.build
> +++ b/rust/hw/char/pl011/meson.build
> @@ -12,6 +12,7 @@ _libpl011_bindings_inc_rs =3D rust.bindgen(
>    include_directories: bindings_incdir,
>    bindgen_version: ['>=3D0.60.0'],
>    args: bindgen_args_common,
> +  c_args: bindgen_c_args,
>  )
>
>  _libpl011_rs =3D static_library(
> diff --git a/rust/hw/core/meson.build b/rust/hw/core/meson.build
> index 81d8c77f9a..e1ae95ed61 100644
> --- a/rust/hw/core/meson.build
> +++ b/rust/hw/core/meson.build
> @@ -41,6 +41,7 @@ _hwcore_bindings_inc_rs =3D rust.bindgen(
>    include_directories: bindings_incdir,
>    bindgen_version: ['>=3D0.60.0'],
>    args: bindgen_args_common + _hwcore_bindgen_args,
> +  c_args: bindgen_c_args,
>  )
>
>  _hwcore_rs =3D static_library(
> diff --git a/rust/migration/meson.build b/rust/migration/meson.build
> index 5e820d43f5..4f8e4ec9d3 100644
> --- a/rust/migration/meson.build
> +++ b/rust/migration/meson.build
> @@ -22,7 +22,8 @@ _migration_bindings_inc_rs =3D rust.bindgen(
>    include_directories: bindings_incdir,
>    bindgen_version: ['>=3D0.60.0'],
>    args: bindgen_args_common + _migration_bindgen_args,
> -  )
> +  c_args: bindgen_c_args,
> +)
>
>  _migration_rs =3D static_library(
>    'migration',
> diff --git a/rust/qom/meson.build b/rust/qom/meson.build
> index 40c51b71b2..9df09f62b4 100644
> --- a/rust/qom/meson.build
> +++ b/rust/qom/meson.build
> @@ -12,6 +12,7 @@ _qom_bindings_inc_rs =3D rust.bindgen(
>    include_directories: bindings_incdir,
>    bindgen_version: ['>=3D0.60.0'],
>    args: bindgen_args_common,
> +  c_args: bindgen_c_args,
>  )
>
>  _qom_rs =3D static_library(
> diff --git a/rust/system/meson.build b/rust/system/meson.build
> index 3ec140de01..0859f39745 100644
> --- a/rust/system/meson.build
> +++ b/rust/system/meson.build
> @@ -20,6 +20,7 @@ _system_bindings_inc_rs =3D rust.bindgen(
>    include_directories: bindings_incdir,
>    bindgen_version: ['>=3D0.60.0'],
>    args: bindgen_args_common + _system_bindgen_args,
> +  c_args: bindgen_c_args,
>  )
>
>  _system_rs =3D static_library(
> diff --git a/rust/util/meson.build b/rust/util/meson.build
> index 87a893673d..9dcde4fae0 100644
> --- a/rust/util/meson.build
> +++ b/rust/util/meson.build
> @@ -22,6 +22,7 @@ _util_bindings_inc_rs =3D rust.bindgen(
>    include_directories: bindings_incdir,
>    bindgen_version: ['>=3D0.60.0'],
>    args: bindgen_args_common + _util_bindgen_args,
> +  c_args: bindgen_c_args,
>  )
>
>  _util_rs =3D static_library(

Reviewed-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>

Regards,
Kohei Tokunaga

--00000000000054b31e063fecd973
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a =
href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>=
&gt;<br>&gt; <br>&gt; Otherwise, no functions are generated:<br>&gt; <a hre=
f=3D"https://github.com/rust-lang/rust-bindgen/issues/2989">https://github.=
com/rust-lang/rust-bindgen/issues/2989</a><br>&gt; <br>&gt; Signed-off-by: =
Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">m=
arcandre.lureau@redhat.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meson.build =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++=
++<br>&gt; =C2=A0rust/bql/meson.build =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
1 +<br>&gt; =C2=A0rust/chardev/meson.build =C2=A0 =C2=A0 =C2=A0 | 1 +<br>&g=
t; =C2=A0rust/hw/char/pl011/meson.build | 1 +<br>&gt; =C2=A0rust/hw/core/me=
son.build =C2=A0 =C2=A0 =C2=A0 | 1 +<br>&gt; =C2=A0rust/migration/meson.bui=
ld =C2=A0 =C2=A0 | 3 ++-<br>&gt; =C2=A0rust/qom/meson.build =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 1 +<br>&gt; =C2=A0rust/system/meson.build =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 +<br>&gt; =C2=A0rust/util/meson.build =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 1 +<br>&gt; =C2=A09 files changed, 13 insertions(+), =
1 deletion(-)<br>&gt; <br>&gt; diff --git a/meson.build b/meson.build<br>&g=
t; index 2f134c9e75..cd2b5fa863 100644<br>&gt; --- a/meson.build<br>&gt; ++=
+ b/meson.build<br>&gt; @@ -4255,6 +4255,10 @@ if have_rust<br>&gt; =C2=A0 =
=C2=A0else<br>&gt; =C2=A0 =C2=A0 =C2=A0bindgen_args_common +=3D [&#39;--mer=
ge-extern-blocks&#39;]<br>&gt; =C2=A0 =C2=A0endif<br>&gt; + =C2=A0bindgen_c=
_args =3D []<br>&gt; + =C2=A0if host_arch =3D=3D &#39;wasm32&#39;<br>&gt; +=
 =C2=A0 =C2=A0bindgen_c_args +=3D [&#39;-fvisibility=3Ddefault&#39;]<br>&gt=
; + =C2=A0endif<br>&gt; =C2=A0 =C2=A0subdir(&#39;rust&#39;)<br>&gt; =C2=A0e=
ndif<br>&gt; <br>&gt; diff --git a/rust/bql/meson.build b/rust/bql/meson.bu=
ild<br>&gt; index f369209dfd..d020a519bf 100644<br>&gt; --- a/rust/bql/meso=
n.build<br>&gt; +++ b/rust/bql/meson.build<br>&gt; @@ -21,6 +21,7 @@ _bql_b=
indings_inc_rs =3D rust.bindgen(<br>&gt; =C2=A0 =C2=A0include_directories: =
bindings_incdir,<br>&gt; =C2=A0 =C2=A0bindgen_version: [&#39;&gt;=3D0.60.0&=
#39;],<br>&gt; =C2=A0 =C2=A0args: bindgen_args_common,<br>&gt; + =C2=A0c_ar=
gs: bindgen_c_args,<br>&gt; =C2=A0)<br>&gt; <br>&gt; =C2=A0_bql_rs =3D stat=
ic_library(<br>&gt; diff --git a/rust/chardev/meson.build b/rust/chardev/me=
son.build<br>&gt; index 370895c111..e7ce02b3bc 100644<br>&gt; --- a/rust/ch=
ardev/meson.build<br>&gt; +++ b/rust/chardev/meson.build<br>&gt; @@ -20,6 +=
20,7 @@ _chardev_bindings_inc_rs =3D rust.bindgen(<br>&gt; =C2=A0 =C2=A0inc=
lude_directories: bindings_incdir,<br>&gt; =C2=A0 =C2=A0bindgen_version: [&=
#39;&gt;=3D0.60.0&#39;],<br>&gt; =C2=A0 =C2=A0args: bindgen_args_common + _=
chardev_bindgen_args,<br>&gt; + =C2=A0c_args: bindgen_c_args,<br>&gt; =C2=
=A0)<br>&gt; <br>&gt; =C2=A0_chardev_rs =3D static_library(<br>&gt; diff --=
git a/rust/hw/char/pl011/meson.build b/rust/hw/char/pl011/meson.build<br>&g=
t; index ffdc8af53f..a33f32906e 100644<br>&gt; --- a/rust/hw/char/pl011/mes=
on.build<br>&gt; +++ b/rust/hw/char/pl011/meson.build<br>&gt; @@ -12,6 +12,=
7 @@ _libpl011_bindings_inc_rs =3D rust.bindgen(<br>&gt; =C2=A0 =C2=A0inclu=
de_directories: bindings_incdir,<br>&gt; =C2=A0 =C2=A0bindgen_version: [&#3=
9;&gt;=3D0.60.0&#39;],<br>&gt; =C2=A0 =C2=A0args: bindgen_args_common,<br>&=
gt; + =C2=A0c_args: bindgen_c_args,<br>&gt; =C2=A0)<br>&gt; <br>&gt; =C2=A0=
_libpl011_rs =3D static_library(<br>&gt; diff --git a/rust/hw/core/meson.bu=
ild b/rust/hw/core/meson.build<br>&gt; index 81d8c77f9a..e1ae95ed61 100644<=
br>&gt; --- a/rust/hw/core/meson.build<br>&gt; +++ b/rust/hw/core/meson.bui=
ld<br>&gt; @@ -41,6 +41,7 @@ _hwcore_bindings_inc_rs =3D rust.bindgen(<br>&=
gt; =C2=A0 =C2=A0include_directories: bindings_incdir,<br>&gt; =C2=A0 =C2=
=A0bindgen_version: [&#39;&gt;=3D0.60.0&#39;],<br>&gt; =C2=A0 =C2=A0args: b=
indgen_args_common + _hwcore_bindgen_args,<br>&gt; + =C2=A0c_args: bindgen_=
c_args,<br>&gt; =C2=A0)<br>&gt; <br>&gt; =C2=A0_hwcore_rs =3D static_librar=
y(<br>&gt; diff --git a/rust/migration/meson.build b/rust/migration/meson.b=
uild<br>&gt; index 5e820d43f5..4f8e4ec9d3 100644<br>&gt; --- a/rust/migrati=
on/meson.build<br>&gt; +++ b/rust/migration/meson.build<br>&gt; @@ -22,7 +2=
2,8 @@ _migration_bindings_inc_rs =3D rust.bindgen(<br>&gt; =C2=A0 =C2=A0in=
clude_directories: bindings_incdir,<br>&gt; =C2=A0 =C2=A0bindgen_version: [=
&#39;&gt;=3D0.60.0&#39;],<br>&gt; =C2=A0 =C2=A0args: bindgen_args_common + =
_migration_bindgen_args,<br>&gt; - =C2=A0)<br>&gt; + =C2=A0c_args: bindgen_=
c_args,<br>&gt; +)<br>&gt; <br>&gt; =C2=A0_migration_rs =3D static_library(=
<br>&gt; =C2=A0 =C2=A0&#39;migration&#39;,<br>&gt; diff --git a/rust/qom/me=
son.build b/rust/qom/meson.build<br>&gt; index 40c51b71b2..9df09f62b4 10064=
4<br>&gt; --- a/rust/qom/meson.build<br>&gt; +++ b/rust/qom/meson.build<br>=
&gt; @@ -12,6 +12,7 @@ _qom_bindings_inc_rs =3D rust.bindgen(<br>&gt; =C2=
=A0 =C2=A0include_directories: bindings_incdir,<br>&gt; =C2=A0 =C2=A0bindge=
n_version: [&#39;&gt;=3D0.60.0&#39;],<br>&gt; =C2=A0 =C2=A0args: bindgen_ar=
gs_common,<br>&gt; + =C2=A0c_args: bindgen_c_args,<br>&gt; =C2=A0)<br>&gt; =
<br>&gt; =C2=A0_qom_rs =3D static_library(<br>&gt; diff --git a/rust/system=
/meson.build b/rust/system/meson.build<br>&gt; index 3ec140de01..0859f39745=
 100644<br>&gt; --- a/rust/system/meson.build<br>&gt; +++ b/rust/system/mes=
on.build<br>&gt; @@ -20,6 +20,7 @@ _system_bindings_inc_rs =3D rust.bindgen=
(<br>&gt; =C2=A0 =C2=A0include_directories: bindings_incdir,<br>&gt; =C2=A0=
 =C2=A0bindgen_version: [&#39;&gt;=3D0.60.0&#39;],<br>&gt; =C2=A0 =C2=A0arg=
s: bindgen_args_common + _system_bindgen_args,<br>&gt; + =C2=A0c_args: bind=
gen_c_args,<br>&gt; =C2=A0)<br>&gt; <br>&gt; =C2=A0_system_rs =3D static_li=
brary(<br>&gt; diff --git a/rust/util/meson.build b/rust/util/meson.build<b=
r>&gt; index 87a893673d..9dcde4fae0 100644<br>&gt; --- a/rust/util/meson.bu=
ild<br>&gt; +++ b/rust/util/meson.build<br>&gt; @@ -22,6 +22,7 @@ _util_bin=
dings_inc_rs =3D rust.bindgen(<br>&gt; =C2=A0 =C2=A0include_directories: bi=
ndings_incdir,<br>&gt; =C2=A0 =C2=A0bindgen_version: [&#39;&gt;=3D0.60.0&#3=
9;],<br>&gt; =C2=A0 =C2=A0args: bindgen_args_common + _util_bindgen_args,<b=
r>&gt; + =C2=A0c_args: bindgen_c_args,<br>&gt; =C2=A0)<br>&gt; <br>&gt; =C2=
=A0_util_rs =3D static_library(<br><br>Reviewed-by: Kohei Tokunaga &lt;<a h=
ref=3D"mailto:ktokunaga.mail@gmail.com">ktokunaga.mail@gmail.com</a>&gt;<br=
><br>Regards,<br>Kohei Tokunaga<br><br></div></div>

--00000000000054b31e063fecd973--

