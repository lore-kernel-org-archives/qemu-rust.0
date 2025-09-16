Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE12CAC599
	for <qemu-rust@archiver.kernel.org>; Tue, 16 Sep 2025 10:14:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uyShI-0007tg-Nj; Tue, 16 Sep 2025 06:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uyShD-0007sh-JS
 for qemu-rust@nongnu.org; Tue, 16 Sep 2025 06:14:00 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uyShA-0008Ln-0O
 for qemu-rust@nongnu.org; Tue, 16 Sep 2025 06:13:58 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-62f1987d4b2so5316567a12.2
 for <qemu-rust@nongnu.org>; Tue, 16 Sep 2025 03:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758017634; x=1758622434; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=++j6klW6GN5e3hzIMYzI5/MR8X6ZXjBvz1+RnvCIlQo=;
 b=ckSgslI6zbiHvUV8/Zi0W9SwtBy2DwQXyJfLO7iiQjBGn274TPmcPkd4cQofmFn/JN
 8DBUs+xPrwR8nappbaNUf2E9zYOC4vGtHgQcmees2j4/XauH7BDkPK8SxWZOPxTWKyZl
 PpGEyMjcw+reNAWk1qOvQcCelYZY2CRUb5sJz8ID2MLWen+CndsdMEx+cDYuBwx9tZWH
 ql7ri5eRWfMhemgKiqV46ZkyVTvsbheyluhNC5Gv9rzpYr2oRXLQDeqQp0+zn8i6BNEu
 v1V+HwtTaBjmzi6Yf9lx09eFNJ4z3l+Lx3kFQLWaX3bsu/3I+v0A6iXqZXC0q7ZxmOrF
 Abuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758017634; x=1758622434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=++j6klW6GN5e3hzIMYzI5/MR8X6ZXjBvz1+RnvCIlQo=;
 b=kBfNWk2uHVY0m7XgLhls2RK6v6+Y2fJhKm6TSdwFnAH7/JS5BTg5MBaLoVMRbWKGhh
 QMGzF1V7hqrGVrXr6AgBYaqyF9eOPEeNdOcMAhDA9q62lgdn2XZM2cAiWf5f2oa3aID0
 h0bKLgutz4GvVH0yoRq7dRyQuAs0BFQCjfTpyfrNs1BQyqHBEY7OUSVoZeoNvSTJdSHR
 sggfpOG0WQD4tatYxXsOMaFIpz31YrrrJ03dz8M33M7j0jp1gIcg7PvhveuxQve/dByL
 NSolWvIKZdtHS/ShafbzfP6OHyfwFqyFpBcjBLlEHWa13haJniaqFkSDXFrsEfpJvRKE
 i7Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG4ukJ0lGV6+jprUPTDEL10WpZMJGUnFHF3iYMFTmIphUg9iwZA77khYR5vuQWnstLYl28CwAdFV4=@nongnu.org
X-Gm-Message-State: AOJu0Yx42W3GS3+WoaohBhbc5Apu2UfJi7v57Y1Y4TUWJlpZiEeEsuOt
 SFGZRLwGFlCtoQP/w0aGnyQ8VmHxKhETeyMI6/i8id0sBSfBmuA7pAjgWbufyK63ZmVpnDQxOwv
 AdO4bTAXWIIrINW6K4tt1HmGaWP5Cepz9FanveAkvrQ==
X-Gm-Gg: ASbGncuhOn7Iqr4B3kc5XRVAJZWtboplKNpQwmekiAPF29XU7HziDKfsjP9teLh0NBW
 oGRznLreakNiUn+L8S6OQ3+GTqEcAN+5SrbQnZNZOnze5DAnD8dfAr5Vw5qSlgs89wdwIQYFIpl
 E/0Ey05yWtfNxKKegD+NlrL8BJ9qO45JJpxEuspheywgaBaPWqKXqPtNaM8I5QcAbNPuqr/yk/U
 2/PTx6g
X-Google-Smtp-Source: AGHT+IFhvZoZvqifBFGcPYKJF2Ey0Ci1YS2m51UsA1eyzF8F4nSpJwtMBJ4AWJTgZx27/dpELJZzqp9XT3gb6LROX54=
X-Received: by 2002:a17:907:1c1d:b0:b04:568b:8a42 with SMTP id
 a640c23a62f3a-b07c35cd7c3mr1546326366b.29.1758017634030; Tue, 16 Sep 2025
 03:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250916085557.2008344-1-zhao1.liu@intel.com>
 <20250916085557.2008344-9-zhao1.liu@intel.com>
In-Reply-To: <20250916085557.2008344-9-zhao1.liu@intel.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 16 Sep 2025 13:13:28 +0300
X-Gm-Features: AS18NWCpvlcfsfK0wVEAjukJfD_JcmmyLbtGWlDM_m_fNV-C6-3dXBU-24Q1ynI
Message-ID: <CAAjaMXaVavbhgF49iCy-kgXB3uk06d=mShK_WrVJu9Bd3HUz0g@mail.gmail.com>
Subject: Re: [PATCH 08/12] rust/qdev: Support property info for more common
 types
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On Tue, Sep 16, 2025 at 11:34=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wro=
te:
>
> Add a helper macro to implement QDevProp trait for u8/u16/u32/usize/i32
> /i64.
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

You can do something like this btw:

macro_rules! impl_qdev_prop {
    ($($type:ty =3D> $info:ident),*$(,)?) =3D> {
        $(unsafe impl $crate::qdev::QDevProp for $type {
            const BASE_INFO: *const $crate::bindings::PropertyInfo =3D
                addr_of!($crate::bindings::$info);
        })*
    };
 }

impl_qdev_prop!(
    bool =3D> qdev_prop_bool,
    u8 =3D> qdev_prop_uint8,
    ...
);


>  rust/hw/core/src/qdev.rs | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/rust/hw/core/src/qdev.rs b/rust/hw/core/src/qdev.rs
> index d887046d8de1..b57dc05ebb0e 100644
> --- a/rust/hw/core/src/qdev.rs
> +++ b/rust/hw/core/src/qdev.rs
> @@ -134,20 +134,24 @@ pub unsafe trait QDevProp {
>      const BASE_INFO: *const bindings::PropertyInfo;
>  }
>
> -/// Use [`bindings::qdev_prop_bool`] for `bool`.
> -unsafe impl QDevProp for bool {
> -    const BASE_INFO: *const bindings::PropertyInfo =3D addr_of!(bindings=
::qdev_prop_bool);
> -}
> -
> -/// Use [`bindings::qdev_prop_uint64`] for `u64`.
> -unsafe impl QDevProp for u64 {
> -    const BASE_INFO: *const bindings::PropertyInfo =3D addr_of!(bindings=
::qdev_prop_uint64);
> +macro_rules! impl_qdev_prop {
> +    ($type:ty,$info:ident) =3D> {
> +        unsafe impl $crate::qdev::QDevProp for $type {
> +            const BASE_INFO: *const $crate::bindings::PropertyInfo =3D
> +                addr_of!($crate::bindings::$info);
> +        }
> +    };
>  }
>
> -/// Use [`bindings::qdev_prop_chr`] for [`chardev::CharBackend`].
> -unsafe impl QDevProp for chardev::CharBackend {
> -    const BASE_INFO: *const bindings::PropertyInfo =3D addr_of!(bindings=
::qdev_prop_chr);
> -}
> +impl_qdev_prop!(bool, qdev_prop_bool);
> +impl_qdev_prop!(u8, qdev_prop_uint8);
> +impl_qdev_prop!(u16, qdev_prop_uint16);
> +impl_qdev_prop!(u32, qdev_prop_uint32);
> +impl_qdev_prop!(u64, qdev_prop_uint64);
> +impl_qdev_prop!(usize, qdev_prop_usize);
> +impl_qdev_prop!(i32, qdev_prop_int32);
> +impl_qdev_prop!(i64, qdev_prop_int64);
> +impl_qdev_prop!(chardev::CharBackend, qdev_prop_chr);
>
>  /// Trait to define device properties.
>  ///
> --
> 2.34.1
>

