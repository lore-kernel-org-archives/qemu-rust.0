Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108BED0E6C3
	for <qemu-rust@archiver.kernel.org>; Tue, 25 Nov 2025 10:48:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vNqal-0008Nc-2f; Tue, 25 Nov 2025 05:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vNqaj-0008MY-26
 for qemu-rust@nongnu.org; Tue, 25 Nov 2025 05:48:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vNqae-0000Dz-Mr
 for qemu-rust@nongnu.org; Tue, 25 Nov 2025 05:48:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764067685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hv5Ak0MaPD3DTUlsFZpK2YD5GN5aNBiQH18NqR3X2f0=;
 b=jMESPi29Q5dZp3+ko5qrmW6qTn1BFpcWVuD39YVI4Xfv4vI5cRyi0XuMgcdWiii6hZtqGz
 tocnXUbGiNCGQQx4s/n6v58tatc0cZa4w8dCn+BVxLNO1pt82HHAbU6OF3OEljhc9DZtKE
 A/9PRwL7wFVZ0rVkSrnDMlIOMXABzBU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-B5y0gGAmOFmnB1MSXNG_yQ-1; Tue, 25 Nov 2025 05:48:03 -0500
X-MC-Unique: B5y0gGAmOFmnB1MSXNG_yQ-1
X-Mimecast-MFC-AGG-ID: B5y0gGAmOFmnB1MSXNG_yQ_1764067683
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42b3ed2c3e3so5268125f8f.1
 for <qemu-rust@nongnu.org>; Tue, 25 Nov 2025 02:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764067683; x=1764672483;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Hv5Ak0MaPD3DTUlsFZpK2YD5GN5aNBiQH18NqR3X2f0=;
 b=Al8EkCMz49Dxhyr9ZQthGjWQa+HLzDs3q944J7/v1lgEN4U8irlT/GLFs2ycz1MgUf
 btWJvA+0ZU52iqcpa6k0A0Y3VQGowx+yHw7o0UzSQdibXEVRnE5YnjGa/xxtofxm1dMr
 zM7VV542qgwTNhwaeGv53lLfm7rUOQBfzSzgOrtrvOzTmlHK39JcHMiHfpfWKYT4VCLC
 Ae6gW+0PE2K/wm62eobUZY5SdyAr1+y0rWAv8FModcav/yhma5qAzY1UWfihgLWjxCYr
 iQStk5RqBOc/LU/Ji4947Q1pVOwSACBQChklz2rVOu1iPCsgNJd4A0HUbu5IXi3afUXc
 FBug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrB3aHW7XTCx0YQoLej47PpLs9nhctdDrRLGAIBZwXoMGM6YqTYcvbm/kY2GURcBW7vB7ohcGaDzk=@nongnu.org
X-Gm-Message-State: AOJu0YyJ/yRphaxZaWbFnOCdW3HucKBBx4lDhUA4cpciMcb6vZ+6E6c8
 TXRVaZAAA+F8DkZqSIALgwFbsZT5zoLzITbn5pEhsyprEKQTj0yxEHAw1IxGhEc5H4q/kBB59Cm
 iJZRVn0JLcJkrqbtuSVe1rugK5GXtjYlK0TakYx2zNR5pPb2B+VeWyPZn/uBAzBnK7zg/mvVA2v
 12oKuLNFoI+IcXDC431a77St1Q5A8vmw==
X-Gm-Gg: ASbGncsmpQkmhhSIT3CSPey9tPlA+hLJKwpu2x/kyVYkhmSoANaUZnFsblm8vtkrP8o
 KJWAwzxrG4tz3wkKGCTL8WAIegHoNwCYHeKF06uxfVU7YZKGMnQP8ARdM4JwkdK8liPPphB+wXF
 izSg+NVE+hISKHzxwnYym9PDRwJh0TG9Mhjg439Hl408fYco4U13bhqXucB7sXkOYCeVdhmvLbm
 JVdTdXBgv1JZ1uUZpDwRWX9/MWYhJ57+FFTrKBFkw4nfbfYTLMed934gvdo3OammAK7hqA=
X-Received: by 2002:a05:6000:288b:b0:3e9:ee54:af71 with SMTP id
 ffacd0b85a97d-42cc1cd8f75mr14937723f8f.12.1764067682569; 
 Tue, 25 Nov 2025 02:48:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdKbq0FvCer0sm3NBT6YiljHXSDZHGdssV2C3TN1ZCzbXR8Q5ItbjTVtOqxhf+PZCy5Q3uxrQbJdxgUMf3pyw=
X-Received: by 2002:a05:6000:288b:b0:3e9:ee54:af71 with SMTP id
 ffacd0b85a97d-42cc1cd8f75mr14937701f8f.12.1764067682093; Tue, 25 Nov 2025
 02:48:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1761644606.git.chenmiao@openatom.club>
In-Reply-To: <cover.1761644606.git.chenmiao@openatom.club>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 25 Nov 2025 11:47:49 +0100
X-Gm-Features: AWmQ_bnA1vv60Je9_DJLlGKrUEY65wxYG5WiLBLdzRZpg3-DNzo4ldYVtaUUPV8
Message-ID: <CABgObfap3WcggLUkRh5u6i44fA9krrmr4ufJj8M6tdVy-FQH7A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] rust/hw: Add the I2C and the first GPIO device
To: chenmiao <chenmiao@openatom.club>
Cc: zhao1.liu@intel.com, manos.pitsidianakis@linaro.org, 
 richard.henderson@linaro.org, philmd@linaro.org, chao.liu@openatom.club, 
 qemu-rust@nongnu.org, qemu-devel@nongnu.org, 
 hust-os-kernel-patches@googlegroups.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3wJM7wHl2n498aLiMCyGd9EsZVCfbIW8uCIBy-_g9eI_1764067683
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.075,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On Tue, Oct 28, 2025 at 11:18=E2=80=AFAM chenmiao <chenmiao@openatom.club> =
wrote:
>
> We have implemented I2C and the first GPIO device in Rust for QEMU.
> Additionally, in the respective patches, we have shared our insights and
> experiences regarding the use of Rust for device modeling within QEMU.
>
> 1. The first patch implements the BusState for the I2CBus infrastructure.
> 2. The second patch implements the I2CBus and I2CSlave infrastructure, al=
ong
>    with a discussion of the challenges encountered during the implementat=
ion.
> 3. The third patch moves the struct definition of the PCF8574 to the
>    corresponding header file.
> 4. The fourth patch provides a set of necessary helper functions for the =
PCF8574
>    GPIO device.
> 5. The fifth patch implements the PCF8574 GPIO device, along with a discu=
ssion
>    of the issues and considerations addressed during the implementation.
>
> Regarding this series of patches, we have found that Rust for QEMU is ind=
eed
> still not mature enough and requires continuous iteration. Additionally, =
the
> lack of basic documentation also needs to be addressed. In this regard, I=
 hope
> our team(HUST OpenAtom Open Source Club) can contribute to the documentat=
ion
> efforts for Rust for QEMU.
>
> Link: https://groups.google.com/g/hust-os-kernel-patches/c/z7vHWg3xvDc
>
> Signed-off-by: Chao Liu <chao.liu@openatom.club>
> Signed-off-by: Chen Miao <chenmiao@openatom.club>

Hi! Are you going to send v3?

Thanks,

Paolo

> ---
> Changes in V2:
>   - According to Zhao's suggestions, some modifications were made to the =
first
>     and second patches respectively, such as changing some bus names, add=
ing
>     some Safety comments, and adding callbacks for I2CSlave.
>   - While we were making changes to the first PATCH, Chao Liu pointed out=
 that
>     the realize function was unnecessary in the bus. After discussion, we
>     removed the bus::realize function. Since no other components are curr=
ently
>     using the bus, we added a TODO comment for clarification.
>
> chenmiao (5):
>   rust/hw/core: Add the BusState of rust version
>   rust/hw/core: Add rust bindings/funcs for i2c bus
>   hw/gpio: Move the pcf8574 struct to header
>   rust/hw/core: Provide some interfaces for the GPIO device
>   rust/hw/gpio: Add the the first gpio device pcf8574
>
>  hw/gpio/Kconfig                      |   5 +
>  hw/gpio/meson.build                  |   2 +-
>  hw/gpio/pcf8574.c                    |  32 --
>  include/hw/gpio/pcf8574.h            |  36 +++
>  rust/Cargo.lock                      |  21 +-
>  rust/Cargo.toml                      |   1 +
>  rust/hw/Kconfig                      |   1 +
>  rust/hw/core/meson.build             |   2 +
>  rust/hw/core/src/bus.rs              |  44 +++
>  rust/hw/core/src/i2c.rs              | 421 +++++++++++++++++++++++++++
>  rust/hw/core/src/irq.rs              |   6 +-
>  rust/hw/core/src/lib.rs              |   6 +
>  rust/hw/core/src/qdev.rs             |  12 +-
>  rust/hw/core/wrapper.h               |   1 +
>  rust/hw/gpio/Kconfig                 |   2 +
>  rust/hw/gpio/meson.build             |   1 +
>  rust/hw/gpio/pcf8574/Cargo.toml      |  31 ++
>  rust/hw/gpio/pcf8574/build.rs        |   1 +
>  rust/hw/gpio/pcf8574/meson.build     |  50 ++++
>  rust/hw/gpio/pcf8574/src/bindings.rs |  29 ++
>  rust/hw/gpio/pcf8574/src/device.rs   | 180 ++++++++++++
>  rust/hw/gpio/pcf8574/src/lib.rs      |   4 +
>  rust/hw/gpio/pcf8574/wrapper.h       |  51 ++++
>  rust/hw/meson.build                  |   1 +
>  24 files changed, 902 insertions(+), 38 deletions(-)
>  create mode 100644 rust/hw/core/src/bus.rs
>  create mode 100644 rust/hw/core/src/i2c.rs
>  create mode 100644 rust/hw/gpio/Kconfig
>  create mode 100644 rust/hw/gpio/meson.build
>  create mode 100644 rust/hw/gpio/pcf8574/Cargo.toml
>  create mode 120000 rust/hw/gpio/pcf8574/build.rs
>  create mode 100644 rust/hw/gpio/pcf8574/meson.build
>  create mode 100644 rust/hw/gpio/pcf8574/src/bindings.rs
>  create mode 100644 rust/hw/gpio/pcf8574/src/device.rs
>  create mode 100644 rust/hw/gpio/pcf8574/src/lib.rs
>  create mode 100644 rust/hw/gpio/pcf8574/wrapper.h
>
> --
> 2.43.0
>


