Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0DBCCA476
	for <qemu-rust@archiver.kernel.org>; Fri, 10 Oct 2025 12:24:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v7CAN-0002IS-2o; Fri, 10 Oct 2025 08:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1v7CAL-0002I1-HZ
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 08:24:09 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1v7CA4-0007Wu-6W
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 08:24:08 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-62fc28843ecso2923839a12.1
 for <qemu-rust@nongnu.org>; Fri, 10 Oct 2025 05:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760099024; x=1760703824; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61F3ksA7PYdsBTIHhvoY3uxIPSjTQ8deWzb9AI9KO1w=;
 b=WBPWiBb4bLXNPZ3TudBeH5oCO0VRkf3tGzXRHUfavyFSsMnLOMItMMLeC5YOjWAyBH
 KchAxriNEIZiwIZ3yHdoKSxr4H5QhlYrav0wwyxtYzc9i+1KJgvSjdBCbuBo5851f6wv
 Rhu7ZMX6SkRlqlPNZ5b4US1tvrB7uWzyBS4GIXlPxVKxr5lHIN6mIqUjic1QgGjf+ATZ
 XNXac13ptXgA9ESZnwEVZXhwo2kPXxOLupCeD7QZE33PCDJJbKX0tOK+NyY48Fzw9cjH
 zTDZ2Zs6zOXksDtLXhM+aRDuzDTqk/uoFvAoOtoO1ZfimH3IOWMtQ0yWa0/v8e7SjNRO
 2X4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760099024; x=1760703824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=61F3ksA7PYdsBTIHhvoY3uxIPSjTQ8deWzb9AI9KO1w=;
 b=bh5LwNQEvNtRRzMfpB7VKGil1EgEMn6eu6OLppY/Hzi3I3IS+NBHh6MKFWhq7Q6wmf
 WxG2086qHMWySBq7SAy0wq2IeIpaziVD5AbRcCYUS807OsfaY2VtfsQ1PPU0w+Hdy/qR
 AnFdguRcH5SiU+29C6YRhmo44p30/Wje8/BLJT9OWRWqo3A/UQIBfD5/FkvUVLmnFvaO
 KTCQU99Asq1PjjHSnUhDl0gB/lFkR067MAD/X3gP5mmgU8irF6lFjnJgyxSJ8IwGFNht
 H/c0Xem5cpblD9kBIRUe/CdRRkDgc5ZYRv0/YkZLkaP3dffo+LPw8+Jmn1EaXsGTRzhC
 ETHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0Fa//QJvxCG+QPV0TgNCop6WF+yOy1xt/BbwScJmW+PNRjX5Au/hXTrmlC2+iJm2C7QU/FyPLIE0=@nongnu.org
X-Gm-Message-State: AOJu0Yy2siK2oXLdmynj2bKfP6xzklB8eJpa9SsknLCtul/wwk5N6AWX
 yG7KqXw9Bg8dOM5Oqe7wmfYkeRM01Au2hAB5CYwpHIlfRuo7MXGDqK18ISM/x0D2lCYmm2/v8hX
 X0SJK9DglPpThTTIT1nQzdVt5NWgxbS/3BqWuMbm1fw==
X-Gm-Gg: ASbGncv5myFLWyRASpGjDFqjwNVLHdDgZxnLCHjx6C6c079cy3/bYLstxEJe+UML7lm
 Rb6guvslfU0L4jmZq0ZXrWUpvO0Jlngc5uPBM+4mgtu//M9zMhEobcgE/yC/0Xqa9mqct9KLsGj
 Hhgs4dBlN6i3w0S8aO4zIlOHpnb3IcokwDsxDok6WNS5M9kt5tIqJLG431A0LXau2JGvkVIPlq/
 6kd2xP3rCtNeQAFtY9bd28eRFHPEVvT7Y1IXQ==
X-Google-Smtp-Source: AGHT+IF+gShXjliGy/ZnBKoVOfgHiCfuLC/rs0Pa5YHKdLzDeu/3+GLHZyA0nnul7pDg3bb8QKC/DVMQ0xZVaO571GA=
X-Received: by 2002:a05:6402:34d0:b0:638:74dc:cf78 with SMTP id
 4fb4d7f45d1cf-639d5c75d9dmr10283150a12.34.1760099023941; Fri, 10 Oct 2025
 05:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20251009211208.643222-1-pbonzini@redhat.com>
In-Reply-To: <20251009211208.643222-1-pbonzini@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 10 Oct 2025 15:23:17 +0300
X-Gm-Features: AS18NWDmuuMkw3l_m71ex9obDDatrZ3q4Xjdc5hWLJDGEQf7zYpRP5_MwSJUj1U
Message-ID: <CAAjaMXaPv+hENfLuZUeLEOjakuw7dOTLQCeaUbuveZW4Y_2PBQ@mail.gmail.com>
Subject: Re: [PATCH] rust: temporarily disable double_parens check
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On Fri, Oct 10, 2025 at 12:12=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
>
> It is showing in the output of the bits! macro and not easy to fix there
> (at least not without making the macro more complex).  Disable it for
> now.
>
> Link: https://github.com/rust-lang/rust-clippy/issues/15852
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

How about putting it in the macro expansion instead of globally allowing it=
?

macro_rules! foo {
    ($a:expr, $b:expr, $c:expr, $d:expr) =3D> {
        #[allow(clippy::double_parens)]
        InterruptMask(((($a.union($b).union($c).union($d))).into_bits()) as=
 u32)
    }
}

Why is the double parenthesis needed here by the way? It's a method chain


>  rust/Cargo.toml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/rust/Cargo.toml b/rust/Cargo.toml
> index 783e626802c..4f98b2c03d3 100644
> --- a/rust/Cargo.toml
> +++ b/rust/Cargo.toml
> @@ -109,6 +109,9 @@ used_underscore_binding =3D "deny"
>  # nice to have, but cannot be enabled yet
>  #wildcard_imports =3D "deny"   # still have many bindings::* imports
>
> +# https://github.com/rust-lang/rust-clippy/issues/15852
> +double_parens =3D "allow"
> +
>  # these may have false positives
>  #option_if_let_else =3D "deny"
>  cognitive_complexity =3D "deny"
> --
> 2.51.0
>
>

