Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B147E7545F
	for <qemu-rust@archiver.kernel.org>; Wed, 24 Dec 2025 14:26:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vYPol-0003bt-R1; Wed, 24 Dec 2025 09:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vYPoI-0003TY-Lw
 for qemu-rust@nongnu.org; Wed, 24 Dec 2025 09:25:58 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vYPoD-0006J2-GR
 for qemu-rust@nongnu.org; Wed, 24 Dec 2025 09:25:53 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b73161849e1so1195340366b.2
 for <qemu-rust@nongnu.org>; Wed, 24 Dec 2025 06:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766586347; x=1767191147; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+p61ZJTEpWEtFw1xTacv9g1rqNFEZG18s4o5mFFKLsc=;
 b=PGJIkX5pN3nQllQkQoIzMVcB02gI0os4yYC50cdOIOAeX0k9nJ1VOGRjMDQTwF7xVG
 joXRHFATubhCo6HoocONxyadm1AzHfIyxUfzaiAeP/Kudseq9obiskdRUDWOt5G6iqwG
 TnfHQ8Ep7NnLAVQYULcEV3uiyIeDV9ycFonGyOiE7hwYc7aBuot7WFWuXgLwwcjmeNmU
 YT2BpcHRqq2gfJTBZ19q7Cy21nQo8mqKE9kJaPR9P+cAs5V62G8b6JzATXmlrIcz5eMJ
 mgON1/b2+4T0REJI4IFnSG31lt0buvc26ITqpnA9+h0XCuO+HPnZrbDiximCdm/fdxQU
 lLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766586347; x=1767191147;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+p61ZJTEpWEtFw1xTacv9g1rqNFEZG18s4o5mFFKLsc=;
 b=Kub9SSLfRJE0YRmunIGfw56OOU6hE+qxYproN7KTtzgU+J91OTcIvFHSWJ9T63jZn9
 0jJvMXVaoeDR6h0YUQCfOpsPimwIvrixq8K4hoykBQXm/p+ZshHxjxyQc5e9pvrU2pxQ
 cWCWXNNfsAd+vyeD9B8uOcD7h1lqZXvv0dZJJ5P1rRmUr7vN3A9n2Jl2y3hwfogwIIs8
 n7W8YQroRiGOBSaosDwLszymxBKqsSFuWyI4wge5G7kJr6zxP3OOrENVc6eDaA7PpAqR
 3lSCshkVmPmOY5EEMY0vQfl9wSBSScdbexUR5VbRPUVjb6fDft06g631GcAoRa79ERZE
 leJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjd/grYLmM34kFveLzyS8cusGZ1p6wNpN94+UmGbm5bhAFSw3AUdcHKacU80FuPesxrqL2+ouiDgQ=@nongnu.org
X-Gm-Message-State: AOJu0Yy455iU7expW1b1l2AqgKs5i2FR+ieMv+JD2vUg3PR/Kd71XfJH
 cX/nHpGwCRpDeS6qgZr+roUy9/PFy9NNDy4EBd1TT+FYLpt9UWxnF3jXYVTy4IUlOSDvjZqJvvR
 KjPjT+z7dJx/MkdgYtjt9LUKp2huV/GSILYKCqDVaEA==
X-Gm-Gg: AY/fxX5Ajc/w86S0ku57DLZ62fTigPr8jS+Ghr9mMwea9XFyJ2of7TDShMcBKsJsw0d
 SDGNPkkxrKseRlvSa1exnPpxmjVZVaRVFRkxhPPk++/ht0XF/v2Nrn4AehLjutQ/KvxVYiSnIjp
 6uOhyupZiyuK33zwAz86evsqBmyuijxxWPlhgxZUaSd1rK06x5Mxm1i70lWNMZkNdW204MDgKB+
 H3mvT0mL0QdtStmzGZ/Z1kqFjMhgcZim02YVO8VNVeyhDzADWhTi0h83CaD+pvry7LFTiU=
X-Google-Smtp-Source: AGHT+IFcbymrjsLO8CryqpgQ4SSzsT+ScTYUq2i2xSJdECtbCdUJYQ4j7Uo8f5agTgcG238o8czbrgKsYAmVuKrutM8=
X-Received: by 2002:a17:907:7f1c:b0:b83:976:50f9 with SMTP id
 a640c23a62f3a-b83097652a7mr246330966b.61.1766586347121; Wed, 24 Dec 2025
 06:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20251224134644.85582-1-philmd@linaro.org>
 <20251224134644.85582-7-philmd@linaro.org>
In-Reply-To: <20251224134644.85582-7-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 24 Dec 2025 16:25:21 +0200
X-Gm-Features: AQt7F2qSewb8AHj-_6egGrk9J0eIkFxytZwrSHAZnM1GKT8lnuvpPseS6gzLd1s
Message-ID: <CAAjaMXbheBrj7cqUrFa7ja7WSZxZYMZpbu5KdGuHYMNui4Z_Dw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] hw/char/pl011: Mark implementation as being
 little-endian
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 qemu-rust@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>, 
 Max Filippov <jcmvbkbc@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x631.google.com
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

On Wed, Dec 24, 2025 at 3:47=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> The PL011 component is only built / used by ARM targets, which
> are only built in little endianness. Thus we only ever built
> as little endian, never testing the big-endian possibility of
> the DEVICE_NATIVE_ENDIAN definition. Simplify by only keeping
> the little endian variant.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

FWIW

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  hw/char/pl011.c                  | 2 +-
>  rust/hw/char/pl011/src/device.rs | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 01335d9437d..97cd9bd4c54 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -538,7 +538,7 @@ static void pl011_clock_update(void *opaque, ClockEve=
nt event)
>  static const MemoryRegionOps pl011_ops =3D {
>      .read =3D pl011_read,
>      .write =3D pl011_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
>  };
> diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/de=
vice.rs
> index 04155dabe1a..a6227a99f30 100644
> --- a/rust/hw/char/pl011/src/device.rs
> +++ b/rust/hw/char/pl011/src/device.rs
> @@ -495,7 +495,7 @@ unsafe fn init(mut this: ParentInit<Self>) {
>          static PL011_OPS: MemoryRegionOps<PL011State> =3D MemoryRegionOp=
sBuilder::<PL011State>::new()
>              .read(&PL011State::read)
>              .write(&PL011State::write)
> -            .native_endian()
> +            .little_endian()
>              .impl_sizes(4, 4)
>              .build();
>
> --
> 2.52.0
>

