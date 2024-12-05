Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJJFv-0005t1-N7
	for mharc-qemu-rust@gnu.org; Thu, 05 Dec 2024 16:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJJFt-0005sS-7D
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 16:19:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJJFp-0004U9-Rn
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 16:19:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733433559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JXI3tsfTyvI9BuejIpXKaDaqjzqRGG5fozWw8z2vD2w=;
 b=fJ3W0IBQZHOP5Da+kAnXzXyXUCU6KFeCSDUPv8VexpXd3L32ZYamqGr2+VllSgZInMtMO6
 P/3XbtwDDOQ3uihAGb/vpHN7aCJDokeXBCPG84Y43QvToWQsHYpOStvTvQyhAYBd6o64O0
 UEtua8LzuiDXJwOD2a2OORVBCm9xLro=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-6jC6CJiLMni1DdddVbalOg-1; Thu, 05 Dec 2024 16:19:18 -0500
X-MC-Unique: 6jC6CJiLMni1DdddVbalOg-1
X-Mimecast-MFC-AGG-ID: 6jC6CJiLMni1DdddVbalOg
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-385d80576abso1014389f8f.3
 for <qemu-rust@nongnu.org>; Thu, 05 Dec 2024 13:19:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733433556; x=1734038356;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JXI3tsfTyvI9BuejIpXKaDaqjzqRGG5fozWw8z2vD2w=;
 b=U/BXtFXKtfzi17BYqYtUza0+2UhEgnncn6NgysFiLJ2JJlurogkMRCN5XhtZupXxfR
 MffmLLAtmNMzs7mG74GCeTJdvdx0iQiE1fHQqm9g7yiHDr1Qqejugq3TYL6PcVKBXrlZ
 yHqZMLVGxJvNmAAowUtbWemjYXgZzuenqPNyQUgDaeZAHwDlQR3Nv9erONsF5/uWwt4U
 pt6mSjg1hJzS/l9Tgxcvk0addrMG9hbAczFpjR5RqmPoyYCRlj/bgjUdkcpQmZx+hzlh
 G/IC7zSGniUrTZSUc9vjxWj6aTK82dB/P8DwU+dDDVk4cwEIxDSoYIi9ztvd0CL7GXwi
 lB3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgRO7e7zeoPGk0WJwUuG5EQ/rUc2Cgfa6Xc/6etjinYWKqWFugg9XCsFcCm/HAODyMVwPewEtVrN0=@nongnu.org
X-Gm-Message-State: AOJu0YwM7/OfTJc4SugPYYC4hXlylW4CH2YsE6U6/WQ4yARVDl/eAf2W
 pyyCTzwUzrOimggobmHBNbswQwJ33bMPCXKs1/TWXxqVktL1UPWGqjrvTKOaK4Kh0jEcYrrIiuz
 57AHvGoi0T8ymtM6jPAthm0I4FTiGHZtmaNu620rdW6TjITzgjabKukVeTMUI3QYE50oMSy9ofV
 3BNIaaZozcZ31id4Fek4bn7x5V2XdTnNGYlw==
X-Gm-Gg: ASbGnctM5iQFRiuNnsjydlqjotLuIEEHnTyd69dV2jc3s7+b5Tn5L3zECD1ViGfiAMV
 D2kFpUWaz42iA1XnbG8ehymIg4J363qeI
X-Received: by 2002:a5d:5f8c:0:b0:385:f66a:4271 with SMTP id
 ffacd0b85a97d-3862b33ce03mr429189f8f.4.1733433555983; 
 Thu, 05 Dec 2024 13:19:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrPmaF9yr+0WjzCSAwMpfuWJn+5BcSt4W/dF3U8X0EMuudal6yikyprmhQBKXNpw1yA0wzRE+hgclksex+D0Y=
X-Received: by 2002:a5d:5f8c:0:b0:385:f66a:4271 with SMTP id
 ffacd0b85a97d-3862b33ce03mr429169f8f.4.1733433555599; Thu, 05 Dec 2024
 13:19:15 -0800 (PST)
MIME-Version: 1.0
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-10-zhao1.liu@intel.com>
 <ed49af53-4a10-4cee-829e-d5921b8aee3c@linaro.org> <Z1GgjZOCc8vkkB3A@intel.com>
 <8cb0a692-420a-4645-b1b8-bc6e47bbb116@linaro.org>
In-Reply-To: <8cb0a692-420a-4645-b1b8-bc6e47bbb116@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 5 Dec 2024 22:19:04 +0100
Message-ID: <CABgObfa7ojzTWOdzd9MUq76ebO8oEU24ew=N80JOOEd=7XuO5g@mail.gmail.com>
Subject: Re: [RFC 09/13] i386/fw_cfg: move hpet_cfg definition to hpet.c
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Zhao Liu <zhao1.liu@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1qJxnSLbquTX2Mry6SRkAadbCDEINmjR6B0gSIFXRWw_1733433557
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 05 Dec 2024 21:19:25 -0000

On Thu, Dec 5, 2024 at 10:18=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 5/12/24 13:46, Zhao Liu wrote:
> > Hi Philippe,
> >
> > On Thu, Dec 05, 2024 at 01:04:58PM +0100, Philippe Mathieu-Daud=C3=A9 w=
rote:
> >> Date: Thu, 5 Dec 2024 13:04:58 +0100
> >> From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> Subject: Re: [RFC 09/13] i386/fw_cfg: move hpet_cfg definition to hpet=
.c
> >>
> >> On 5/12/24 07:07, Zhao Liu wrote:
> >>> HPET device needs to access and update hpet_cfg variable, but now it =
is
> >>> defined in hw/i386/fw_cfg.c and Rust code can't access it.
> >>>
> >>> Move hpet_cfg definition to hpet.c (and rename it to hpet_fw_cfg). Th=
is
> >>> allows Rust HPET device implements its own global hpet_fw_cfg variabl=
e,
> >>> and will further reduce the use of unsafe C code access and calls in =
the
> >>> Rust HPET implementation.
> >>>
> >>> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> >>> ---
> >>>    hw/i386/fw_cfg.c        |  4 +---
> >>>    hw/timer/hpet.c         | 16 +++++++++-------
> >>>    include/hw/timer/hpet.h |  2 +-
> >>>    3 files changed, 11 insertions(+), 11 deletions(-)
> >>
> >>
> >>> diff --git a/include/hw/timer/hpet.h b/include/hw/timer/hpet.h
> >>> index d17a8d43199e..dbf709251a8f 100644
> >>> --- a/include/hw/timer/hpet.h
> >>> +++ b/include/hw/timer/hpet.h
> >>> @@ -74,7 +74,7 @@ struct hpet_fw_config
> >>>        struct hpet_fw_entry hpet[8];
> >>>    } QEMU_PACKED;
> >>> -extern struct hpet_fw_config hpet_cfg;
> >>> +extern struct hpet_fw_config hpet_fw_cfg;
> >>
> >> Could this field belong to the (yet unexisting) HPETClass?
> >
> > Several instances would share the same class, so HPETClass could manage
> > multiple HPETState info.
> >
> > But in fw_cfg.c, do you have idea about how to get the HPETClass?
>
> Have hpet_find() return an Object and call object_get_class()?

That would work, but anyhow this patch breaks compilation without HPET
so the question is a bit moot. :)

Paolo


