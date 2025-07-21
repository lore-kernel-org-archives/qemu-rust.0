Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8070BC83F1A
	for <qemu-rust@archiver.kernel.org>; Mon, 21 Jul 2025 11:33:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1udojE-0000c9-PN; Mon, 21 Jul 2025 07:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1udoil-0008Fd-10
 for qemu-rust@nongnu.org; Mon, 21 Jul 2025 07:30:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1udoii-0000sY-7w
 for qemu-rust@nongnu.org; Mon, 21 Jul 2025 07:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753097410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hs7f7j7fI0OO/CAtxJbLTNRYzwsIwU9dsY3IKOgaKvs=;
 b=b6Eh4hTe6oAHWA+1SQcLanKLsBt7tWyn6omL0KvP6fn7us7KMtpdT9FdoyTITUfpR0SZ7x
 NtYIIOq+tv4oQC7x7HQfJPZ9lvmdF1evNmfm8h/JOoFVnICqiiyExK4QHuh4qIiHN++OSJ
 lSle6U/JtSk03N965feZUyw4r3Sdj0k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-Q_3B96N6OJ28HAsu8L37Lg-1; Mon, 21 Jul 2025 07:30:09 -0400
X-MC-Unique: Q_3B96N6OJ28HAsu8L37Lg-1
X-Mimecast-MFC-AGG-ID: Q_3B96N6OJ28HAsu8L37Lg_1753097408
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4eee2398bso1715052f8f.1
 for <qemu-rust@nongnu.org>; Mon, 21 Jul 2025 04:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753097408; x=1753702208;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hs7f7j7fI0OO/CAtxJbLTNRYzwsIwU9dsY3IKOgaKvs=;
 b=Cr6ZMSiw4k1IpHvS47DLqBBfYsn7rfNk1YJyS1avukGlEGdXAvtTdtPjmIXVL9OG35
 z/woNnGOzpm+MQA6XX/fao1y/+1KTMyFuRDpEbXaedvePbGkGeU2Q1GcCvzjb+CRexFj
 q3XDawF44VI8JeQ8Bns333SCyfcpoyEgloyMJ1Wt4Fn7mh7mciBjfFWWMxlrXJHvIII8
 SNyt46ft7vF+mYbujRBs6JuwM1wBVI/LIhCep6oyHAz93XnMPNCNJPnJcEwhhxKjqCHy
 7VyPdMwxM3+b26gpGwbuCmyVALebxvOV8BWVAs+IwD7AEm3RVeMVIDct9aBdB6BrvIRd
 DthA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlV9oiGzGvOBve+IEBrleswk08fdyXR05i7m2SFAzQNYbSePBL8mcnQ8OILv7sRBFL1b3eb/fX334=@nongnu.org
X-Gm-Message-State: AOJu0Yw6H2+OCyhRxWmK5BZ24i8ew6FKb+IegDJm4ss3br/Nu04Qy4PQ
 zxwAzwitDtoxWV/BBog4k9mmltl12SdQIXPZXHPYuYeqhbSfE3y9pN7JGHJHG/iqnSu/Fd8NR5S
 LujoqG+GuIlJ5YxN/g+78zLe1R2LZ5b37VTwXerIqvagHKUZpmY0c2zVfx+2nP5LSnMI5h9CvRk
 EpPAE4lsKViRQyZiRplgoDDwuudJUO1w==
X-Gm-Gg: ASbGncuJd63A19eCsi6l8Ary7l1f5pc1dRFke0q/e/+aNs/H2IrXTTEVMjJz3oRy985
 qerIlu4M1qBiKg3P94wC83V4pzc3x7P2GIOJf6uMn6DSBbIZyKZuPhNmTg3F82VIKtS9zF6UzIR
 IG7vQUUt+aX0C0ET0xC+C8
X-Received: by 2002:a05:6000:1882:b0:3a4:edf5:b942 with SMTP id
 ffacd0b85a97d-3b60ddc647bmr17902127f8f.57.1753097407599; 
 Mon, 21 Jul 2025 04:30:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1qmDDOWiFNtK+/rQq9m/cbQ8DJfJoivXRUReH721YKHVqe2+tJIJnqLZYBTZS5Aa+OpwjfKcMs+DvpurihdA=
X-Received: by 2002:a05:6000:1882:b0:3a4:edf5:b942 with SMTP id
 ffacd0b85a97d-3b60ddc647bmr17902091f8f.57.1753097407084; Mon, 21 Jul 2025
 04:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250721105238.461477-1-pbonzini@redhat.com>
 <CAAjaMXY7aO18R+0S8fyB0ageb1D_8gd_HkFRsDE80Qa8ECWiBg@mail.gmail.com>
In-Reply-To: <CAAjaMXY7aO18R+0S8fyB0ageb1D_8gd_HkFRsDE80Qa8ECWiBg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 21 Jul 2025 13:29:55 +0200
X-Gm-Features: Ac12FXzVoqxIsQHnWHWCHyNIDxF4VaOiST_soTkNZDUzX9fAKqTqakp2QaoAHTY
Message-ID: <CABgObfYHcBu-PgaLX60u8DqKaxCVcy-8gitWZ=DzbkryhPGzyw@mail.gmail.com>
Subject: Re: [PATCH] rust: devices are not staticlibs
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eawzF7rr_1slL01kLySaB0a_BS2Pq5fcINuYUc6IxcY_1753097408
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.926,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Jul 21, 2025 at 1:01=E2=80=AFPM Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> Hi Paolo,
>
> On Mon, Jul 21, 2025 at 1:53=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.co=
m> wrote:
> >
> > This is only cosmetic for now, but hopefully later on Meson will parse =
more
> > of Cargo.toml.  Devices are linked into a staticlib but are not staticl=
ibs
> > themselves.
>
> Does meson compile them as rlibs instead of staticlibs?

Yes, see "rust_abi: 'rust'". I think you can't even do "extern crate"
with a staticlib - the only staticlib is the per-target one that is
put together via scripts/rust/rust_root_crate.sh.

In theory https://github.com/mesonbuild/meson/pull/14818 should allow
removing the staticlib as well, using rustc instead of gcc to create
the final executable even if it has system/main.c listed as one of its
sources. Executables should than be smaller or they can use dynamic
libstd. I haven't tested that yet though...

Paolo


