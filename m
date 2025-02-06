Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tfxQn-0005XC-DQ
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 03:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfxQZ-0005RF-Px
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 03:40:04 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfxQX-0006qo-7L
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 03:40:03 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38dc0cd94a6so85304f8f.0
 for <qemu-rust@nongnu.org>; Thu, 06 Feb 2025 00:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738831199; x=1739435999; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RRBCmpXi86GF5fl4sYooUTspcXzwih+sD5Ce9BzWcZA=;
 b=pxVUczfV9W5kobxoU7Dntg64s26xe+NAtPYIaN0LNH23+BWX4yvxUnbq+7fNqJdTZR
 L5Hu6TKRxaTFi/rT/lW7u+CH8uuwBjqpFZIrIkphC/vYE9Vt4Eb5qPlocSb2I4lA8GUV
 KdoZp3Rh3SW87h3MRfFktTA/rFjoXEXEc9EqG9xh8vzGGeLgjo7vlVZfODEXRWKa81z0
 LQZEq9P7eWAntb4nqFRHWjNVUgV0/H96UCzSGwZKOOutd1U1E/7ZEvK8Oss4aY+ucBXy
 e0N59Cpz0OBhGwfClESq8xwfciz2Ys1Leza9JiKL2qkN4bid9N/5s3mYh2Faz3TQLSdn
 b7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738831199; x=1739435999;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RRBCmpXi86GF5fl4sYooUTspcXzwih+sD5Ce9BzWcZA=;
 b=i1zYS2nLJNqD5v4zW/1330Irpl4AVTwCZGQgEvI/7+W5Lgzgx5fd7vP1CTFntQQ9co
 PBqb6gM//F3vEfQLsk2oqm6TkGjHb/TIZ7dDBPS3MWYH1CAu8mToObypuZpOUdpR8FWn
 D5Frz6YF6+cuOjrZ+WsSvpX2kxHzVETiHbKBYmst5wJXg+2kk6Nw9yqeNNLr4nYYBLna
 xk5fo9ssU6OpUWh7KL0FRG6OWXqLettlS/+GMFIXONpC+b8NxTCHzwFeWVjcV6Gcm9pa
 AgNc6qDOM9CYiy1WKeE3co05HToJ7UQJxnzUrGCpj6ACRx9qqF/TbGL+jBHTdK7XrkCC
 Hdpg==
X-Gm-Message-State: AOJu0YxnSP1ZfT5Y0I+BzVN6zBktA/bPrVpvkpvR5Ed9a6VI4Tz9DknI
 johGa8rZNjxU5SeDRWfm42mbZXszboJt6tbDsAtGo+jAiqKPmij6kOyIUdV/ACY=
X-Gm-Gg: ASbGncuzUcVF4IFiYu94Pmq9SUQJyX/fV7qiqytSI/dY0nTF98X6B/EwuvwYoGihFGJ
 PKSLTZqkvciCN8aItOl44CWFQ5UKFEvp5YHbQNMp+g+lQvzbGnVmzZELulN0GWvLhTAe3ERhdym
 erfDkKFCIwQaU+JjVILheTFT3dfSOCW22TzphBj3GI9LdieFPaRdYgfKNdzpymlE1w2fnmjdnni
 mVIpXIrXwcsqjaVDXcT0EBp7TgfGaoCylQVzvf/wTuToValhXllC4ZKnV9zK1Dys0Kqp2rji2o2
 7es95DB05zDG+NoNDOvf9jegNW5T+79xclv4NJpzZ8afH1ATXZFxlFOkS+8=
X-Google-Smtp-Source: AGHT+IHou+ssgCD7cHcPG4ExQ3JCnYX8LGVk+AR5k7qkQMftTDZDlOg1us89AHGKgsacb/rIsCNToQ==
X-Received: by 2002:a5d:5f93:0:b0:38d:a90c:d489 with SMTP id
 ffacd0b85a97d-38db491fd30mr4322471f8f.45.1738831199381; 
 Thu, 06 Feb 2025 00:39:59 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf4480sm47486765e9.27.2025.02.06.00.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 00:39:58 -0800 (PST)
Message-ID: <7e35b5b6-01dd-457b-b36f-507a85300b45@linaro.org>
Date: Thu, 6 Feb 2025 09:39:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] rust: bindings for MemoryRegionOps
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
References: <20250117194003.1173231-1-pbonzini@redhat.com>
 <20250117194003.1173231-11-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250117194003.1173231-11-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-List-Received-Date: Thu, 06 Feb 2025 08:40:05 -0000

Hi Paolo,

On 17/1/25 20:40, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   rust/hw/char/pl011/src/device.rs     |  43 +++---
>   rust/hw/char/pl011/src/lib.rs        |   1 -
>   rust/hw/char/pl011/src/memory_ops.rs |  36 -----
>   rust/qemu-api/meson.build            |   1 +
>   rust/qemu-api/src/lib.rs             |   1 +
>   rust/qemu-api/src/memory.rs          | 191 +++++++++++++++++++++++++++
>   rust/qemu-api/src/sysbus.rs          |   7 +-
>   rust/qemu-api/src/zeroable.rs        |  12 ++
>   8 files changed, 234 insertions(+), 58 deletions(-)
>   delete mode 100644 rust/hw/char/pl011/src/memory_ops.rs
>   create mode 100644 rust/qemu-api/src/memory.rs
> 
> diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
> index 259efacb046..294394c6e82 100644
> --- a/rust/hw/char/pl011/src/device.rs
> +++ b/rust/hw/char/pl011/src/device.rs
> @@ -2,7 +2,7 @@
>   // Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>   // SPDX-License-Identifier: GPL-2.0-or-later
>   
> -use core::ptr::{addr_of_mut, NonNull};
> +use core::ptr::{addr_of, addr_of_mut, NonNull};
>   use std::{
>       ffi::CStr,
>       os::raw::{c_int, c_void},
> @@ -12,14 +12,14 @@
>       bindings::{self, *},
>       c_str, impl_vmstate_forward,
>       irq::InterruptSource,
> +    memory::{hwaddr, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder},
>       prelude::*,
> -    qdev::{Clock, ClockEvent, DeviceImpl, ResettablePhasesImpl, ResetType},
> +    qdev::{Clock, ClockEvent, DeviceImpl, ResetType, ResettablePhasesImpl},
>       qom::{ClassInitImpl, ObjectImpl, Owned, ParentField},
>   };
>   
>   use crate::{
>       device_class,
> -    memory_ops::PL011_OPS,
>       registers::{self, Interrupt},
>       RegisterOffset,
>   };
> @@ -490,20 +490,24 @@ impl PL011State {
>       /// location/instance. All its fields are expected to hold unitialized
>       /// values with the sole exception of `parent_obj`.
>       unsafe fn init(&mut self) {
> +        static PL011_OPS: MemoryRegionOps<PL011State> = MemoryRegionOpsBuilder::<PL011State>::new()
> +            .read(&PL011State::read)
> +            .write(&PL011State::write)
> +            .native_endian()

Could we always make .valid_sizes() explicit?

> +            .impl_sizes(4, 4)
> +            .build();
> +
>           // SAFETY:
>           //
>           // self and self.iomem are guaranteed to be valid at this point since callers
>           // must make sure the `self` reference is valid.
> -        unsafe {
> -            memory_region_init_io(
> -                addr_of_mut!(self.iomem),
> -                addr_of_mut!(*self).cast::<Object>(),
> -                &PL011_OPS,
> -                addr_of_mut!(*self).cast::<c_void>(),
> -                Self::TYPE_NAME.as_ptr(),
> -                0x1000,
> -            );
> -        }
> +        MemoryRegion::init_io(
> +            unsafe { &mut *addr_of_mut!(self.iomem) },
> +            addr_of_mut!(*self),
> +            &PL011_OPS,
> +            "pl011",
> +            0x1000,
> +        );


> diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
> index 300c732ae1d..5622e974cbc 100644
> --- a/rust/hw/char/pl011/src/lib.rs
> +++ b/rust/hw/char/pl011/src/lib.rs
> @@ -29,7 +29,6 @@
>   
>   mod device;
>   mod device_class;
> -mod memory_ops;
>   
>   pub use device::pl011_create;
>   
> diff --git a/rust/hw/char/pl011/src/memory_ops.rs b/rust/hw/char/pl011/src/memory_ops.rs
> deleted file mode 100644
> index 95b4df794e4..00000000000
> --- a/rust/hw/char/pl011/src/memory_ops.rs
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -// Copyright 2024, Linaro Limited
> -// Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -
> -use core::ptr::NonNull;
> -use std::os::raw::{c_uint, c_void};
> -
> -use qemu_api::{bindings::*, zeroable::Zeroable};
> -
> -use crate::device::PL011State;
> -
> -pub static PL011_OPS: MemoryRegionOps = MemoryRegionOps {
> -    read: Some(pl011_read),
> -    write: Some(pl011_write),
> -    read_with_attrs: None,
> -    write_with_attrs: None,
> -    endianness: device_endian::DEVICE_NATIVE_ENDIAN,
> -    valid: Zeroable::ZERO,
> -    impl_: MemoryRegionOps__bindgen_ty_2 {
> -        min_access_size: 4,
> -        max_access_size: 4,
> -        ..Zeroable::ZERO
> -    },
> -};


