Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F333CAC5B8
	for <qemu-rust@archiver.kernel.org>; Fri, 26 Sep 2025 15:47:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v2Aev-0002go-9A; Fri, 26 Sep 2025 11:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v2AeT-0002TJ-1A
 for qemu-rust@nongnu.org; Fri, 26 Sep 2025 11:46:31 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v2AeD-0001nx-1X
 for qemu-rust@nongnu.org; Fri, 26 Sep 2025 11:46:26 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46b7bf21fceso17703795e9.3
 for <qemu-rust@nongnu.org>; Fri, 26 Sep 2025 08:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758901567; x=1759506367; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BqS3Goqj63+B1mgLpvk95pT/+QyQN2YsQObxw5uNn7U=;
 b=zMd3LX4zo+5jLYmO8hfdNoPawCZaqi3rxZWy+FxNfypv0eEgv6S2UDXFi3Y3LEHpuU
 L3b61vDnGfPshS+SNgnToR+3qY43GWUK+7J2rIqEFdvX6nMaM+lTy8kocvLGPalXVr6Y
 WrYjk/ifC9I2DtQ+Uwliqwk7wUzjPGGX+NSK106lfCgH2EWn6ywGooumoF31ohMPWIDk
 t1rly/TYmMQadehmioKik00jU9rSjcYslsX8Nk+0szuhGJ0lPbJZv+8HBzJMNDLN000+
 +dKM7H1VGt0y44HRogoCBJeZCljYySNzQOPPcOjnpU5V+4qnvGfJGLrB2NT3CsDyQDjL
 W2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758901567; x=1759506367;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BqS3Goqj63+B1mgLpvk95pT/+QyQN2YsQObxw5uNn7U=;
 b=t5EkOPOHACkhUK1oNcwSyyhjLE7GNsvpTte5o+rkhLQBdSa2CWYvdX50QIPlircIXu
 lkHTRXboEcrMEKkkURkcVhKk3Y3BTfEwrjPnJzRDgOiVVzJLxqrLKQWGucgmnb6gufGp
 hSZ7Q6EmUWMxG3NhYBX6XsynbLWgHZZnu3BE5Rq3hpMGSJrhVWv+NtelCe2whbE6/zYR
 yNqYaMbMP1FZ/E5pj/jT7ri1Z7yXgS853nLHWS/8OT+qQHQ41qbmjHFTMgTXO9NrzneR
 qd0g9bhPw35FGmm/hKEmaYyGJJ7jRw6vYJTlhMd7zy9TRt178GLnVld920E8gmT0Gswk
 ZKzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvPPvmYfOsU5EqpLUheyOCVplOISl6xfuMZxX+X/hmyZ16p9PxW82nwpQ5MM5135YjBwXRPE/1t4A=@nongnu.org
X-Gm-Message-State: AOJu0Yx5V2W2vU6KfSdHr9Bl8t2vwhiX37BFaXHRn+UyIpM9W9kVoF5L
 LYqcN+AiduEhUCCqeopSbAo03cKLEFCd9TL23Pk/L0pmVPARd+zq7LJiHOx4RhzB0oYJ33JlcXz
 edC8DQdU=
X-Gm-Gg: ASbGncsdEUab7DcUXUDxVm0eFAFulnGbtNgbIwmmGktVxFAG7dhFXvRZmk9s8DK0ZCm
 r5pTjdxTUnLWvNZSphMVPBhEGxnbVEluBjUKfafpJKmXQ2NFbCwh8IZxBPEq4zaUVOlT3oa231L
 EfiekD6nOSsGto5+qlCdNCfphUwXYbhdISoelv4H0UvLEvZT756Os78g8LoxmJVGodQXpHsOiCe
 lNasQTGpyIoclYeOWd7LXhKg6XTE69LOLuRWZK1CZLOlYx6dBGEbmc7fTT36+fhfWL3m2exFUWl
 BokSzzHvDWvkHb6Kiu5f0ceOvX6Uv/TPqMHIIdL2PxKhBCbWVrIg/yG3qu/IPXE2Q6LFdmySwr1
 tU2IJNIyNqqyhuy+sZvggJcXOE2/YfJmis9vaJP4so3W7
X-Google-Smtp-Source: AGHT+IHqWCxVCSqODhsJgXq9ydHALRRLegrZ5ZoHa2xPMSWyfFnTWGWu9DsCUBFvz21ElUZKAXATFQ==
X-Received: by 2002:a05:6000:22c7:b0:3ee:1563:a78b with SMTP id
 ffacd0b85a97d-40e4745e23dmr7505535f8f.20.1758901567448; 
 Fri, 26 Sep 2025 08:46:07 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e42eee0b6sm10693895e9.10.2025.09.26.08.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 08:46:06 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0D7225F7C3;
 Fri, 26 Sep 2025 16:46:06 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Kyle Evans
 <kevans@freebsd.org>,  Yonggang Luo <luoyonggang@gmail.com>,  Li-Wen Hsu
 <lwhsu@freebsd.org>,  Thomas Huth <thuth@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Warner Losh <imp@bsdimp.com>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ed Maste <emaste@freebsd.org>,  devel@lists.libvirt.org,
 qemu-rust@nongnu.org,  Kohei Tokunaga <ktokunaga.mail@gmail.com>
Subject: Re: [PATCH v2 22/27] RFC: tests/docker: add rust to
 debian-legacy-test-cross
In-Reply-To: <20250924120426.2158655-23-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Wed, 24 Sep 2025 16:04:19 +0400")
References: <20250924120426.2158655-1-marcandre.lureau@redhat.com>
 <20250924120426.2158655-23-marcandre.lureau@redhat.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Fri, 26 Sep 2025 16:46:06 +0100
Message-ID: <871pnti5dt.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Unfortunately, debian 11 has bindgen version 0.55...
> Should we install it with cargo install bindgen-cli?

I wouldn't bother. This only exists for older targets that are either
linux-user or unlikely to get a rust version of any of their device
backends.

>
> Linking is still failing with -lrt, despite it being present in the link =
arguments...
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml                               | 2 +-
>  tests/docker/dockerfiles/debian-legacy-test-cross.docker | 9 ++++++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index c3467200f4..34d8c1a496 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -389,7 +389,7 @@ build-legacy:
>    variables:
>      IMAGE: debian-legacy-test-cross
>      TARGETS: alpha-linux-user alpha-softmmu sh4-linux-user
> -    CONFIGURE_ARGS: --disable-tools
> +    CONFIGURE_ARGS: --disable-tools --enable-rust
>      MAKE_CHECK_ARGS: check-tcg
>=20=20
>  build-user-hexagon:
> diff --git a/tests/docker/dockerfiles/debian-legacy-test-cross.docker b/t=
ests/docker/dockerfiles/debian-legacy-test-cross.docker
> index 5a6616b7d3..f9b31b0eab 100644
> --- a/tests/docker/dockerfiles/debian-legacy-test-cross.docker
> +++ b/tests/docker/dockerfiles/debian-legacy-test-cross.docker
> @@ -24,6 +24,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>  RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>          apt install -y --no-install-recommends \
>          bison \
> +        cargo-web \
>          ccache \
>          clang  \
>          flex \
> @@ -36,14 +37,20 @@ RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>          python3-pip \
>          python3-setuptools \
>          python3-venv \
> -        python3-wheel && \
> +        python3-wheel \
> +        rustc-web \
> +        && \
>          dpkg-query --showformat '${Package}_${Version}_${Architecture}\n=
' --show > /packages.txt
>=20=20
> +ENV CARGO_HOME=3D/usr/local/cargo
> +RUN cargo install bindgen-cli
> +
>  RUN /usr/bin/pip3 install tomli
>=20=20
>  ENV QEMU_CONFIGURE_OPTS --disable-system --disable-docs --disable-tools
>  ENV DEF_TARGET_LIST alpha-linux-user,sh4-linux-user
>  ENV MAKE /usr/bin/make
> +ENV PATH=3D$CARGO_HOME/bin:$PATH
>  # As a final step configure the user (if env is defined)
>  ARG USER
>  ARG UID

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

