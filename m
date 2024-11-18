Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tCzR5-0002cE-AG
	for mharc-qemu-rust@gnu.org; Mon, 18 Nov 2024 05:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tCzR2-0002bh-FK
 for qemu-rust@nongnu.org; Mon, 18 Nov 2024 05:56:48 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tCzR0-0004ro-RE
 for qemu-rust@nongnu.org; Mon, 18 Nov 2024 05:56:48 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5cb15b84544so2461671a12.2
 for <qemu-rust@nongnu.org>; Mon, 18 Nov 2024 02:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731927405; x=1732532205; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wgbpPqyJ37eXI4U9cjLKsKq9PUDJgdylzUDJzUHlhPc=;
 b=HH7RI9iCk58QuAtY1Oj1lfoaZZL3OteRSD+qCm1x3N2eWivWmlmMMjARRljkiXoqxw
 /dd8306M2/TI/znzUSCU9FcY+U4eSq+z3936WalckhGI4OBrAS+7FCIDQ59YMUy7yDS1
 ns7uCf0yIOC3aaM3eI0Cy9VS9yWw54E4hBN5YJL3mv6bpDVBVnvY/asAkx36+I4gdPUb
 mADruXpcnfPzi4w8ZW/7iD5bEOcN6+gFxnm47u1O/W4gGhcKQczwkXCOR8no/BUg9vlk
 ygEjg1bqfmfGEUjT2Yx6JV2JtCo0A7EHAMk4TDdQmRJg8hSSTjJSeKzdKsHrpoH0j2U4
 ryDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731927405; x=1732532205;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wgbpPqyJ37eXI4U9cjLKsKq9PUDJgdylzUDJzUHlhPc=;
 b=aiai1AhUusFrSodLIVgOoXo0mN9zkDrJzqgNY91ihx0IxzSRnh8S7rVJn+Sc+Y18kx
 C0vj9V4aLbgapnyiEfDOvUYfwM56d3wpuz7/WDk28jRf/19+HTQTr1ER5kppcOraoYgi
 7AvDutuOOJRelEjZITWz03sqU2Yx6uH//RQVjh75dAJz+BfXwKSLYVW7r+H0ddcdYAja
 q3WYlAANZGipyNhWtV+74vY1K6D2TS4LfPXM9LhP5Azg+i1qW4p52NXYfyTMZCKjPqw0
 eZoetbDdlysb5E7f8y+Zp1MV63jHO0didTh8wc7pRLqXLNc9B0nzFPMvoDsmASv3lVbK
 v7FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4gUV1CUEPo93O41g+pWQNrd3chPpCaCih4K9icXaFF5NQx8GU0chPSHa7viIq9ZpauoYJpaTrLzs=@nongnu.org
X-Gm-Message-State: AOJu0Yx3Rnkc6zFDjHIgZKTEQDI/UqHXDOWfW1sRutRGhspiQgM8m96C
 FWGytMX6nfaYlpKV3q7jJ05rtqy/7aNCzLARlqD61N+8Rimbl42wZJEoq436hNTo8cDpdA93ffC
 o
X-Google-Smtp-Source: AGHT+IG/TA3UOkLU2Qn3B+5GvnJEn9ylZ1RfrQ3TvHoJoJirrxv2E71PadeXF6RZcQ/WRbsXzexbYw==
X-Received: by 2002:a17:907:6ea4:b0:a99:762f:b298 with SMTP id
 a640c23a62f3a-aa483525e24mr996157766b.41.1731927404802; 
 Mon, 18 Nov 2024 02:56:44 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df50cfesm534435766b.66.2024.11.18.02.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 02:56:43 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B7BB15F7C6;
 Mon, 18 Nov 2024 10:56:42 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-rust@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: CC rust/ patches to qemu-rust list
In-Reply-To: <20241109-update-maintainers-file-rust-v1-1-f4daba6f782f@linaro.org>
 (Manos Pitsidianakis's message of "Sat, 09 Nov 2024 21:29:36 +0200")
References: <20241109-update-maintainers-file-rust-v1-1-f4daba6f782f@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 18 Nov 2024 10:56:42 +0000
Message-ID: <87h684u7x1.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 18 Nov 2024 10:56:49 -0000

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> As of CAFEAcA-ZQuyGTtG-vhRTEwpz0L4cpimNxkKix45Yw6gVHXozRQ@mail.gmail.com
> we have a new topical mailing list like qemu-block, qemu-arm, qemu-ppc
> etc but for Rust related patches. Add a new MAINTAINERS entry to touch
> all files under rust/ subdirectory and additionally add it to previous
> rust related entries.

Queued to maintainer/for-9.2 with tweak suggested by PMD to commit
message.

>
> See also:
> https://lore.kernel.org/qemu-devel/CAFEAcA-ZQuyGTtG-vhRTEwpz0L4cpimNxkKix=
45Yw6gVHXozRQ@mail.gmail.com/
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 095420f8b0..373176e445 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3338,6 +3338,10 @@ F: rust/qemu-api
>  F: rust/qemu-api-macros
>  F: rust/rustfmt.toml
>=20=20
> +Rust-related patches CC here
> +L: qemu-rust@nongnu.org
> +F: rust/
> +
>  SLIRP
>  M: Samuel Thibault <samuel.thibault@ens-lyon.org>
>  S: Maintained
> @@ -4241,6 +4245,7 @@ F: docs/devel/docs.rst
>=20=20
>  Rust build system integration
>  M: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> +L: qemu-rust@nongnu.org
>  S: Maintained
>  F: scripts/rust/
>  F: rust/.gitignore
>
> ---
> base-commit: 134b443512825bed401b6e141447b8cdc22d2efe
> change-id: 20241109-update-maintainers-file-rust-5cbd97b7b11a

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

