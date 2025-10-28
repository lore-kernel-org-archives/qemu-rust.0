Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0213CCF9EE
	for <qemu-rust@archiver.kernel.org>; Tue, 28 Oct 2025 10:47:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vDhER-0000HQ-Ph; Tue, 28 Oct 2025 06:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vDhE1-0008DC-Bj
 for qemu-rust@nongnu.org; Tue, 28 Oct 2025 06:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vDhDw-0005u3-NW
 for qemu-rust@nongnu.org; Tue, 28 Oct 2025 06:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761648401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqswuCohGI/O8Z9pOr54ZNHujtz9Cg9VUJQ0QE3M9/s=;
 b=BFZG75Fw+zx4jGaH5TQp6zF57ZSFDKky6GLIkf1OQbYzqXeaSKBjJ+ni8J5YqdPiAVOKTb
 +uwtLlx3eiJ9/QhyEkxf9dpiyLGjAOMU1cYDOWlN833DoHDdT9+kv1uZqe+S6VfibyOI1Y
 +tv+9OtITeSuzvagVDuDBJBWi6j9jiQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-yaDFPYRRPJGe4moecqS2RA-1; Tue, 28 Oct 2025 06:46:40 -0400
X-MC-Unique: yaDFPYRRPJGe4moecqS2RA-1
X-Mimecast-MFC-AGG-ID: yaDFPYRRPJGe4moecqS2RA_1761648399
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-426feed0016so1906055f8f.3
 for <qemu-rust@nongnu.org>; Tue, 28 Oct 2025 03:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761648399; x=1762253199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oqswuCohGI/O8Z9pOr54ZNHujtz9Cg9VUJQ0QE3M9/s=;
 b=h7LAOKETUkZCaBanuYrYacceQPzW8o2KlLui02UvQ5BsUy5hqOoywl6teoi6oOOOwN
 +I5meTEJN7bHi1Y93bn/upQZgx+ocwkfhrmHokM+pueF51F0lIIQ3KxB8DOxoXKsDgBp
 ssvAOvGKrKspNh4XNgZ7rvFU+QjCW04fbiXRq+y6NsqRGoqGf5CNH6C9OHUwj2MxPgd3
 phTsBkdwkrsjNODjrey3Xc49TfuuZpS6/Ks2agReWyueDbsuCe0g4gW0qGukPlaM64I+
 GX1HfKWHOfFD3wxxtfq6UBBl2UXtKAiHjTHQs14rARlV3W+boktUZbFnCm8oveXCC/sB
 0BhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcG5PyADy/M1EYjezvR+FwWYgpvQYfKC/eIm7Y+HwRL+yEt1kWBvbJPPpbpBCcslJv17PnC/NnBAg=@nongnu.org
X-Gm-Message-State: AOJu0Yw0U5kkqRaFs6qemBYaNv8jhmy3qTwdk0c2npRHapzS7oZL/IOb
 yOtrkZqUrenLVUuAoNTlZ6Fp59kvEqO6rrmZwijBpiS2ggBEcdYFosRmdT8b42EbhUPE2eHOaVK
 iD1cdl2chZoHdJFLcLubx6JFxRu2lwOS5DYgFTlruCYxQC6Orjl7UqxT+A9A4u24dszSA+VR0lC
 AhPHXkWLKPjmiFvgHoIfB720M6CXAVSQ==
X-Gm-Gg: ASbGncuLOSKvTUEof3zppXeaQouq0Y3XceJWsQzday6v2ZWIYkD1YuojNAcmZ9VvdF8
 Z8DvBfrAB/ct17/pHFAaS6GASDEN88I2XPHnQLufPV4kf36n2WdjDdBwdzWpjt17BW2lFw1tTAx
 23IdbKZiiXRll50SXRRL8fbGXuDLQELIy1GG7PyKFlCOyQEU4+CaDRQW6uNyIVvIBLGe1Z7w4h1
 W8m7O+60EsG7aVKV9bwAa5olHXJKf+0n/7BDVN2EQzcCSZDT/mvrAy8knnV
X-Received: by 2002:a05:6000:290c:b0:427:7ad:466f with SMTP id
 ffacd0b85a97d-429a7e83a78mr2445401f8f.39.1761648398969; 
 Tue, 28 Oct 2025 03:46:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPWkS17TzLd/QE4SHuRoKCUtw0TrWEdmtuZ6c5g7w+i8DEOEeGCmi1GFQB+A9ScnDHNzxOp1Q8i+I/v0UfXOk=
X-Received: by 2002:a05:6000:290c:b0:427:7ad:466f with SMTP id
 ffacd0b85a97d-429a7e83a78mr2445365f8f.39.1761648398504; Tue, 28 Oct 2025
 03:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <90746cd6a57c0df971158f604c422a23d750e0b4.1761644606.git.chenmiao@openatom.club>
In-Reply-To: <90746cd6a57c0df971158f604c422a23d750e0b4.1761644606.git.chenmiao@openatom.club>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 28 Oct 2025 11:46:26 +0100
X-Gm-Features: AWmQ_bnsVmMuJKLz4wLLnF7FNTgdlpPIZ7-XG8OEzdCH4xAw5wUwlTwvFMjUwjU
Message-ID: <CABgObfZEm7nu1gRPHQnYc-WJ2PHrBa40VX6Qv2bRTWBYt2BsOA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] hw/gpio: Move the pcf8574 struct to header
To: chenmiao <chenmiao@openatom.club>
Cc: zhao1.liu@intel.com, manos.pitsidianakis@linaro.org, 
 richard.henderson@linaro.org, philmd@linaro.org, chao.liu@openatom.club, 
 qemu-rust@nongnu.org, qemu-devel@nongnu.org, 
 hust-os-kernel-patches@googlegroups.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Hy_wAwxhz-pYAQ1i0PUL8zKCSePEsaGmX2FPe6p6vAY_1761648399
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> To better implement the Rust PCF8574 bindings, move its struct definition=
 to
> the header file.

This should not be needed, the struct is entirely hidden within the C
implementation and the same should be true for the Rust one.

Paolo

> Signed-off-by: chenmiao <chenmiao@openatom.club>
> ---
>  hw/gpio/pcf8574.c         | 32 --------------------------------
>  include/hw/gpio/pcf8574.h | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 32 deletions(-)
>
> diff --git a/hw/gpio/pcf8574.c b/hw/gpio/pcf8574.c
> index 274b44bb61..670fc006bb 100644
> --- a/hw/gpio/pcf8574.c
> +++ b/hw/gpio/pcf8574.c
> @@ -15,38 +15,6 @@
>  #include "qemu/module.h"
>  #include "qom/object.h"
>
> -/*
> - * PCF8574 and compatible chips incorporate quasi-bidirectional
> - * IO. Electrically it means that device sustain pull-up to line
> - * unless IO port is configured as output _and_ driven low.
> - *
> - * IO access is implemented as simple I2C single-byte read
> - * or write operation. So, to configure line to input user write 1
> - * to corresponding bit. To configure line to output and drive it low
> - * user write 0 to corresponding bit.
> - *
> - * In essence, user can think of quasi-bidirectional IO as
> - * open-drain line, except presence of builtin rising edge acceleration
> - * embedded in PCF8574 IC
> - *
> - * PCF8574 has interrupt request line, which is being pulled down when
> - * port line state differs from last read. Port read operation clears
> - * state and INT line returns to high state via pullup.
> - */
> -
> -OBJECT_DECLARE_SIMPLE_TYPE(PCF8574State, PCF8574)
> -
> -#define PORTS_COUNT (8)
> -
> -struct PCF8574State {
> -    I2CSlave parent_obj;
> -    uint8_t  lastrq;     /* Last requested state. If changed - assert ir=
q */
> -    uint8_t  input;      /* external electrical line state */
> -    uint8_t  output;     /* Pull-up (1) or drive low (0) on bit */
> -    qemu_irq handler[PORTS_COUNT];
> -    qemu_irq intrq;      /* External irq request */
> -};
> -
>  static void pcf8574_reset(DeviceState *dev)
>  {
>      PCF8574State *s =3D PCF8574(dev);
> diff --git a/include/hw/gpio/pcf8574.h b/include/hw/gpio/pcf8574.h
> index 3291d7dbbc..fe1ce891b7 100644
> --- a/include/hw/gpio/pcf8574.h
> +++ b/include/hw/gpio/pcf8574.h
> @@ -10,6 +10,42 @@
>  #ifndef _HW_GPIO_PCF8574
>  #define _HW_GPIO_PCF8574
>
> +#include "qemu/osdep.h"
> +#include "hw/i2c/i2c.h"
> +#include "qom/object.h"
> +
>  #define TYPE_PCF8574 "pcf8574"
>
> +/*
> + * PCF8574 and compatible chips incorporate quasi-bidirectional
> + * IO. Electrically it means that device sustain pull-up to line
> + * unless IO port is configured as output _and_ driven low.
> + *
> + * IO access is implemented as simple I2C single-byte read
> + * or write operation. So, to configure line to input user write 1
> + * to corresponding bit. To configure line to output and drive it low
> + * user write 0 to corresponding bit.
> + *
> + * In essence, user can think of quasi-bidirectional IO as
> + * open-drain line, except presence of builtin rising edge acceleration
> + * embedded in PCF8574 IC
> + *
> + * PCF8574 has interrupt request line, which is being pulled down when
> + * port line state differs from last read. Port read operation clears
> + * state and INT line returns to high state via pullup.
> + */
> +
> +OBJECT_DECLARE_SIMPLE_TYPE(PCF8574State, PCF8574)
> +
> +#define PORTS_COUNT (8)
> +
> +struct PCF8574State {
> +    I2CSlave parent_obj;
> +    uint8_t  lastrq;     /* Last requested state. If changed - assert ir=
q */
> +    uint8_t  input;      /* external electrical line state */
> +    uint8_t  output;     /* Pull-up (1) or drive low (0) on bit */
> +    qemu_irq handler[PORTS_COUNT];
> +    qemu_irq intrq;      /* External irq request */
> +};
> +
>  #endif /* _HW_GPIO_PCF8574 */
> --
> 2.43.0
>


