Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030FFCAC5A9
	for <qemu-rust@archiver.kernel.org>; Fri, 19 Sep 2025 10:41:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uzYYa-0004zz-Kf; Fri, 19 Sep 2025 06:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uzYYX-0004wS-6I
 for qemu-rust@nongnu.org; Fri, 19 Sep 2025 06:41:33 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uzYYU-0002wb-Ex
 for qemu-rust@nongnu.org; Fri, 19 Sep 2025 06:41:32 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so287395066b.1
 for <qemu-rust@nongnu.org>; Fri, 19 Sep 2025 03:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758278488; x=1758883288; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lerSm6n0kEc/ak2Qs+X5z0DYC9NL2LWkFkkl5WnCWCI=;
 b=K5h/cTefnmQjm+2expp61MrjUc4V3RoXM9JBnFYP5k8nJb7ZBewrjhDsGG9vi6jHJq
 C6zKBLAQjfoTcWJkNKDIUIPOuxVLPpqR0kR++951Hz+TnyorjXoysvxlD219UQOlYz3c
 2KddVMnx/8l0kgMmPBofazWXfnD9JToI7ETX+YLesExkKecA9ufS4goAk7SzqurUJSK3
 gXXhjp02VZOGK0kvtsdmiw7tPMCQ+2q6pd5KSw8yoX5y2u11qFl5xl44T7GtCmUAqK/4
 6WhjKICky2tpgvTVK8riOl5E8yTjkr7KnTCdtN/2gzGYtF62lnuwsjGfRcPTWA2q9PZp
 I6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758278488; x=1758883288;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lerSm6n0kEc/ak2Qs+X5z0DYC9NL2LWkFkkl5WnCWCI=;
 b=tADBtX/PBkd7HHMJ7XN+0N5C2pufk9Fl/r1TPjWn6gcU9Y4l2ccvA8PGi4cg7gbq9k
 sFz/ir2uG/KieLdV9bJWz97fJ1pZlMv00R451MYWsAD9JoiL65fxfionqRM+sivOvL9M
 XCRxj6ij5CI3jrzYkeGr5ummb/x/Tyvh5vnPb6ETAjEiJDSsBkZ58e6I3/Nv8n6FRKQc
 YIisxYR9oZRB/6CYJqH3bkqAdMhzMhBktZDLFWnhvOdNcSEp+1Jtc9teo2I+2vZSzEtM
 K2xhRrgJsias5+xb3rVCBY85IEGLgi+qxjNu+LQK/XfVYPnAEEE2J4ZahB869lMeR3bW
 8PaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQwEzM41kvxNcI1KhE9T1DTdhJnV/clcut4YDDO1y5eYbJhpP07eu2BQmuOHQQM8qQ8K7mEsACIXA=@nongnu.org
X-Gm-Message-State: AOJu0YyciOkDDtlZIycBJ0/CE/mczZ3NWm9QVp8J1AwWfIgj2Q0hUlwz
 4TGqcoNr9A215zDPEyCsT70b1yxKauK0V6Zp6i4nC0ETjVyt1Wv1Shbw0vB/8zzxPgLcdZXTfYJ
 I+MFXMkVCBlzgLxXx38tuTx6Lvktr8vpHY/nBCMce3g==
X-Gm-Gg: ASbGnctULoOflf+iBSKBKkAmLRiNdP1/oUchF2gdyq5XAG6hp0KuxRkmlOpWdN9znjW
 B77NnfdxPGnhUa2MYzg6+RbudA2Svsi3OHKLhJsFco4clEQ6MGhWeykbjQxQ9OyPeHY9CI2J9Cs
 Dv9QUkmG00+sr4PY9G2o1NJ2lh8SAmmg2H/8//vo1MqmArBE/Zs7sBSKShIqYB+P07DFpPienDZ
 nuBNw==
X-Google-Smtp-Source: AGHT+IG2ly5GzPGbufCbZSQM7GVgtls4V5XGyYAgKETjPIt6zONASg2Tctahm/Az/1rCvyirkoYfG6p7rO9V/uX+x94=
X-Received: by 2002:a17:907:d1a:b0:b09:48c6:b7ad with SMTP id
 a640c23a62f3a-b24f65eca66mr300495066b.57.1758278487756; Fri, 19 Sep 2025
 03:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250919083617.86582-1-pbonzini@redhat.com>
In-Reply-To: <20250919083617.86582-1-pbonzini@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 19 Sep 2025 13:41:01 +0300
X-Gm-Features: AS18NWAFI6NN5ftxhJ-E-MFpPQAhHDstqlEpCicCi_PAmcGSzZSkkrPF_EUsQDM
Message-ID: <CAAjaMXbYASsQuCRcN7ggCB-5GpMr6Qc+JYXUzMxRdh4E45M5nQ@mail.gmail.com>
Subject: Re: [PATCH] rust: build: add back common and util tests
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62e.google.com
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

On Fri, Sep 19, 2025 at 11:37=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
>
> These were dropped by mistake when extracting the crates.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  rust/common/meson.build | 3 +++
>  rust/util/meson.build   | 4 ++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/rust/common/meson.build b/rust/common/meson.build
> index b805e0faf57..07d073182ed 100644
> --- a/rust/common/meson.build
> +++ b/rust/common/meson.build
> @@ -24,6 +24,9 @@ _common_rs =3D static_library(
>
>  common_rs =3D declare_dependency(link_with: [_common_rs])
>
> +rust.test('rust-common-tests', _common_rs,
> +          suite: ['unit', 'rust'])
> +
>  # Doctests are essentially integration tests, so they need the same depe=
ndencies.
>  # Note that running them requires the object files for C code, so place =
them
>  # in a separate suite that is run by the "build" CI jobs rather than "ch=
eck".
> diff --git a/rust/util/meson.build b/rust/util/meson.build
> index 87a893673d2..96330504459 100644
> --- a/rust/util/meson.build
> +++ b/rust/util/meson.build
> @@ -44,6 +44,10 @@ _util_rs =3D static_library(
>
>  util_rs =3D declare_dependency(link_with: [_util_rs], dependencies: [qem=
uutil, qom])
>
> +rust.test('rust-util-tests', _util_rs,
> +          dependencies: [qemuutil, qom],
> +          suite: ['unit', 'rust'])
> +
>  # Doctests are essentially integration tests, so they need the same depe=
ndencies.
>  # Note that running them requires the object files for C code, so place =
them
>  # in a separate suite that is run by the "build" CI jobs rather than "ch=
eck".
> --
> 2.51.0
>
>

