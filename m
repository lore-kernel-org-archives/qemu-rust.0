Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B849C5DF94
	for <qemu-rust@archiver.kernel.org>; Mon, 24 Aug 2026 07:18:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wyOwE-0006nQ-9k; Mon, 24 Aug 2026 03:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wyOwC-0006mV-Cm
 for qemu-rust@nongnu.org; Mon, 24 Aug 2026 03:17:44 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wyOw8-00085V-1y
 for qemu-rust@nongnu.org; Mon, 24 Aug 2026 03:17:44 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-84faf0fa17eso3151050b3a.2
 for <qemu-rust@nongnu.org>; Mon, 24 Aug 2026 00:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787555858; cv=none;
 d=google.com; s=arc-20260327;
 b=V//Yw+/h+Fl2T43tjUG+5C6uGDFPqOTNIrQT1J2cojmcHeB4r25Ie8sjmvSSnG/I2U
 qkl77dgETZS04JowqwNLYfZFgq0URydyrUt0qhGmED5nTUqSJ9VIyvTo7wiLVMnoJlFq
 v1KAv7/olXlWKPHBFMbqY+mqJTH2ZFpDim13IKJ8W/nZh1ZWBpOsiUez5hVmDrknxc9Z
 tbY0C6YygwWXQk5djwmLSzKdbreW9DS0uyYWCrp5GOv7306gLU4czhsYbFIkHcCPoAFe
 nTFFPlysS8mkAyE1o0zSe325Kh/gOiTxMtjWj60Fp9C4554f6coSPJO5qW6OExMZ9wza
 8IWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=mpPEEbA9UdYrgd5wh14VBht3tJdhjuUSena60ew66w8=;
 fh=yH8fhnR76hyUfraXos8+hB5kVysXpmCwsaWKKnP0mso=;
 b=FGF4BsByJHpclZ4gAdjF+IjucNaidWwSEJeS5HQAWnvRe+lc3yEE53XKngFim84sgp
 g1XQ6DrpcAui15pQuKyDYRkb1mKzdQuLXbGhQRwolO+jPmIV8A35SCRjCW7aXdn28aZg
 6tgQBZhYfAwRJ6eV80DBIydtyzQhyT0CNaNtzxY3GAwhDIBuYBSw6TjWmVzB6WUkKWSC
 4B6O/qI8sJhTCfeVdqDIaBFhtcbiqExEq+VywevCMGHe5sOlFzLECFL/aRKSY5BjSAm0
 KrgtDndlxrKXOpBe7WBchjtQVAXD9Oj72nZw6Xgc0gnihx7q1KI739iCfqcttfUx/Khj
 EnXQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787555858; x=1788160658; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mpPEEbA9UdYrgd5wh14VBht3tJdhjuUSena60ew66w8=;
 b=Heowsogq5Z9GJ5uvvvkj9ktwfM1mhCfdtY9KGP+qSD+HGNWgH2EWVYT28oTnZNdDZV
 IwRGkJhafOEZx0TI2fn9mMxC+gJvJMZQWVMyWO716u3Ht1AHnLXNqLhtgActjv9qP4pZ
 fQ2/KbY9gX2SAwU4/IC6cp5bRhZ2UhDD7A6naVU7thkpbDoHx5dzU6UUWe23e5pQdTqC
 9r0MFc5qUuBdpmVqI4x68phggYHtS14jGAh7n2+zos1lWPJ/2ZA15WQD6p37z5gJDqpU
 341S2f1gU71C88cm4hJT6M7jv2IYyP9hDfW4A9pCOqKO5umemTYOSCyklz2WTWEORVjU
 TIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787555858; x=1788160658;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mpPEEbA9UdYrgd5wh14VBht3tJdhjuUSena60ew66w8=;
 b=ar7A4SsXYGZM9+p6cV07Sov9SgTt9bhzoBPgfLtFAvKmOKg4w84h63zqaL3vGkAMo6
 RxrS8mzNNjkmeKoxnbVLj4d7P4Unb8AzUPv82PckRsiOb6Oh9HBW2IWbwAsAvLDUd8UA
 kKK1ImuSjAFkXndUnvhULwQq6WI33JKc6YNvsj+V0oquXOTiZshMsvAhOjfEFu7CZFzp
 SUOhv1gdRPqYrDj0+3kY+sZ7iG/uaewhzeBf4Ji0h/3h4rTGOBSjogvCzchqtktgzQMc
 HXpSX4j3ssfBE09AXGpuI4MMxxpVNN9dihdXlOoIlBdcA1rBYTvNSgRJ7TdYGJTN7HHw
 nvEQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpByp9SqBEgC+G0ktZtHvcOHE0wA/MSsBnDOt44dXQAbHNzMV6pBhfIob2kLO8PwjgIl3s3mA5PaC4=@nongnu.org
X-Gm-Message-State: AFuF++neCddZoUSo/OTXYTndqbsj/VbPv4i4XfmSU+MvqecRVG5RUGcE
 YVAphIePbeFc9jJ5s2pwb5Wmr0LGeAYOouaq2WN2TC04B8FfTere+hzozWoHKVpOm9bZNmZBgWr
 ISxvlF4KQh2r9tF1dfgxDnu44hsCA+5WTf/w4
X-Gm-Gg: AR+sD12RtG7yF4MnKVVbabcQMtZ8FDQ9aGTcKYmNdIv1nqFRdElU/P4Fk6XcXabSF8y
 +J+6vQGJ5rcOtJNleTn45odX93ITLJfCpuv+ez0XF6ubthBpdUkjf9OE1/UKmqcW2aESmxvgiP7
 FvtJ0othP/bHIxMlOvliMeb6JztSIivIbp1mHN3lhtXHOM0Nl7e8PlQ+OWCKaY+uTwFFV1OhdiM
 5WJ3khodn0uQQBBviordSlgv2uMtybuSbuz6vVm2cRbjS3h08Y5X3C84jyz+temUoclXGq5lISZ
 5dOVH5GJsaKyl61MmuDEGPzv4/ibP6W5oT0Gw8pcuYq9Stx72BeUU8vTF1a8AxQc26m3Ke8LuWF
 QiRBAI67Jmbfd
X-Received: by 2002:a05:6372:a744:b0:3cd:7bb1:1183 with SMTP id
 adf61e73a8af0-3cd7bb11219mr5903728637.18.1787555858014; Mon, 24 Aug 2026
 00:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260821083925.2008135-1-pbonzini@redhat.com>
In-Reply-To: <20260821083925.2008135-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 24 Aug 2026 11:17:25 +0400
X-Gm-Features: AcwNN1XJ_SV97XWkkJXgMQZF6DMMxth-kS_V5mkqVwxBA2bSWrUQCGUJeZTNRJc
Message-ID: <CAJ+F1CKyUghQ3r3aOm6zPdHNLUCCsmJWrf18qs4zuf8FfjnYHA@mail.gmail.com>
Subject: Re: [PATCH 0/9] scripts: introduce script to update cargo .wrap files
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi

On Fri, Aug 21, 2026 at 12:40=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
>
> Another small piece of the usability puzzle for Rust, this time
> tackling dependency updates.
>
> Extend the existing scripts/get-wraps-from-cargo-registry.py so
> that it is also able to use the versions in Cargo.lock.  This
> makes it much easier to update .wrap files after running
> "cargo update", though manual work is (intentionally) still
> needed when the semver of a crate changes.
>
> It's possible that this functionality will be moved to Meson either
> wholly or in part.  As usual, introduce the prototype in QEMU so that
> it's clear what is needed.
>

Series lgtm, but I wasn't able to apply on master (patchew neither)

thanks

> Paolo
>
>
> Paolo Bonzini (9):
>   scripts: print build.rs diff
>   scripts: rename variable in scripts/get-wraps-from-cargo-registry.py
>   scripts: do not assume the new version of the crate is present
>   scripts: prepare for introduction of CrateSource class
>   scripts: introduce CrateSource abstract class
>   scripts: add functionality to update wrap files from Cargo.lock
>   scripts: add the possibility of a quick update of the pacakge
>   scripts: rename get-wraps-from-cargo-registry.py
>   rust: update crates
>
>  Cargo.lock                                    |  48 ++---
>  Cargo.toml                                    |   2 +-
>  ...argo-registry.py =3D> update-cargo-wraps.py} | 198 +++++++++++++-----
>  subprojects/attrs-0.2-rs.wrap                 |   9 +-
>  subprojects/foreign-0.3-rs.wrap               |   9 +-
>  ...sys-0.21-rs.wrap =3D> glib-sys-0.22-rs.wrap} |   9 +-
>  subprojects/libc-0.2-rs.wrap                  |  10 +-
>  .../libc-0.2-rs/meson/meson.build             |  20 +-
>  subprojects/quote-1-rs.wrap                   |  10 +-
>  subprojects/unicode-ident-1-rs.wrap           |  10 +-
>  10 files changed, 207 insertions(+), 118 deletions(-)
>  rename scripts/{get-wraps-from-cargo-registry.py =3D> update-cargo-wraps=
.py} (38%)
>  rename subprojects/{glib-sys-0.21-rs.wrap =3D> glib-sys-0.22-rs.wrap} (1=
3%)
>
> --
> 2.55.0
>
>


--=20
Marc-Andr=C3=A9 Lureau

