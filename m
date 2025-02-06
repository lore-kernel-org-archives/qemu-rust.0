Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tfyif-0004EJ-9S
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 05:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfyid-0004Dw-A2
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 05:02:47 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfyia-0006qX-Qf
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 05:02:47 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so7248955e9.2
 for <qemu-rust@nongnu.org>; Thu, 06 Feb 2025 02:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738836163; x=1739440963; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yeaok4WWlYGNgKeHMkGKkK/9rdsvj/4UHjdGDu32Oy8=;
 b=cO/ncsmxaRlah9zFcRLG5VnkYET59yAvsO8Z4PwzUMKGB8TgDirzTUEC7c4AxDSnFT
 sMX8SAsE+clurduuuA+zmMYfwPz9hGLlHZRxrZ1ARvTYz+t9b1GhK7Q711QouzfumYhx
 XB0YFMDh/M6WfhDXoy2+v+N3ZRpsD/nmukQO0CDiXqWTtNzBBEiY/qpzCKdKiRXe+YgS
 nryphywXqvhgEFxfB0INqVfWo0Ou0pHFHJ757HDuC7XtYkpZFCjtKSH3u2GzQkbxC7dY
 dtjaH6H6ZDQG7YME5eYxAv0iRmul9QxiHHz2gUrT9thGj8aLXwzZrYbWq6jZ5cAyweUL
 Orzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738836163; x=1739440963;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yeaok4WWlYGNgKeHMkGKkK/9rdsvj/4UHjdGDu32Oy8=;
 b=VkK0IGLkh0argFZuki4Jsg65ZQn7Nfe5chAyG2+u7TWi29rwoRg1VCJZbPmCr72A+u
 gTzsZX3trwyHVHd9eltcOBhxrbJF8hOcB1rrPs8Q1W5o5rwSTuDInJoZjlziBOnMv9ti
 i8Q0rKnLH/77empiREvbBb9LChwm0qpMcyZxCPVJa0wVz0gNTr8BJ/Hdp1zAMxB0KSQy
 WqkHSpQpnOuAD+YDP8FpbUfjSiXoYQWfXRaERFfKGtLQAgR+ptr/BpTn5Uvy/2nlt2SY
 8Rl+rAIs5cuUt2EwWVLhzWQLnBAM3/Zvd/PpNwtCBTQ2+z7BqXx086VLRcePYi2pC8/i
 HB0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoRbnxXoxelz+dPvo12xfzXcTrxmEGr6FS+c2Ji3qK9RHnT8COu5W/Y+OBaFKLVi0m7PUUaRzBHYE=@nongnu.org
X-Gm-Message-State: AOJu0Yxoh8+1yGOAKk82yGXMJ3lQdHES8IEEWEwEiK7aA2q3Tq2Semdd
 y6mAK+ZWR1tBhiMJTzPjSfaBqidp7RlFUmArTIYXC2dHhmF71W/WxSjtWxvDSq0=
X-Gm-Gg: ASbGncty3hTyqLDXdK1OK9orNRV0inkG4e72ems77qqfXinFxHlWquf9Y73iZdFBxNv
 k1P4H4kwCrEYOmaVt+e+nuEtI/Jo9K28egRINv9yW+CcyHpX0XIUqCZqrgmtrb7EwyAF3168Stb
 51mdUKBD7NhbZRp0PAXUZdgD5KCcIthqIZ7gPUVnRz3D0JNn6FUicro3M3c7DoqW6nVSsrXSz7c
 ofqskrUFX+t8FJCdv9HtYcxVz5U5CT7mkF4Fg4mA73t2GszPKQaKP8LHNu1T593n80/yWLVebHM
 wiSHiD8MZOyiChk2hYRFBIBMKp9WRvzXN/klfFCmTYqnp94BmUs6dvDwmqY=
X-Google-Smtp-Source: AGHT+IG/gEHZ8REiLMok8ShQ3D84gz/1Ju0Z6FbD/3cJgyS2L4S9uHvQnQMCItnrNJmt1kfdcd+5ug==
X-Received: by 2002:a05:600c:4586:b0:434:a734:d279 with SMTP id
 5b1f17b1804b1-4390d43e90emr70963515e9.16.1738836162996; 
 Thu, 06 Feb 2025 02:02:42 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbde1de32sm1266558f8f.83.2025.02.06.02.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 02:02:42 -0800 (PST)
Message-ID: <ad5dcd1b-ae0e-42ac-befe-a33b3f900c71@linaro.org>
Date: Thu, 6 Feb 2025 11:02:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] rust: bindings for MemoryRegionOps
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250117194003.1173231-1-pbonzini@redhat.com>
 <20250117194003.1173231-11-pbonzini@redhat.com>
 <7e35b5b6-01dd-457b-b36f-507a85300b45@linaro.org>
 <CABgObfbr4yHBJxCVtOk9rQau3Z8M-QUy0+OqTnjecTsKTXrH0Q@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CABgObfbr4yHBJxCVtOk9rQau3Z8M-QUy0+OqTnjecTsKTXrH0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Thu, 06 Feb 2025 10:02:47 -0000

On 6/2/25 09:46, Paolo Bonzini wrote:
> On Thu, Feb 6, 2025 at 9:40 AM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Hi Paolo,
>>
>> On 17/1/25 20:40, Paolo Bonzini wrote:
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>    rust/hw/char/pl011/src/device.rs     |  43 +++---
>>>    rust/hw/char/pl011/src/lib.rs        |   1 -
>>>    rust/hw/char/pl011/src/memory_ops.rs |  36 -----
>>>    rust/qemu-api/meson.build            |   1 +
>>>    rust/qemu-api/src/lib.rs             |   1 +
>>>    rust/qemu-api/src/memory.rs          | 191 +++++++++++++++++++++++++++
>>>    rust/qemu-api/src/sysbus.rs          |   7 +-
>>>    rust/qemu-api/src/zeroable.rs        |  12 ++
>>>    8 files changed, 234 insertions(+), 58 deletions(-)
>>>    delete mode 100644 rust/hw/char/pl011/src/memory_ops.rs
>>>    create mode 100644 rust/qemu-api/src/memory.rs
>>>
>>> diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
>>> index 259efacb046..294394c6e82 100644
>>> --- a/rust/hw/char/pl011/src/device.rs
>>> +++ b/rust/hw/char/pl011/src/device.rs
>>> @@ -2,7 +2,7 @@
>>>    // Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>>    // SPDX-License-Identifier: GPL-2.0-or-later
>>>
>>> -use core::ptr::{addr_of_mut, NonNull};
>>> +use core::ptr::{addr_of, addr_of_mut, NonNull};
>>>    use std::{
>>>        ffi::CStr,
>>>        os::raw::{c_int, c_void},
>>> @@ -12,14 +12,14 @@
>>>        bindings::{self, *},
>>>        c_str, impl_vmstate_forward,
>>>        irq::InterruptSource,
>>> +    memory::{hwaddr, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder},
>>>        prelude::*,
>>> -    qdev::{Clock, ClockEvent, DeviceImpl, ResettablePhasesImpl, ResetType},
>>> +    qdev::{Clock, ClockEvent, DeviceImpl, ResetType, ResettablePhasesImpl},
>>>        qom::{ClassInitImpl, ObjectImpl, Owned, ParentField},
>>>    };
>>>
>>>    use crate::{
>>>        device_class,
>>> -    memory_ops::PL011_OPS,
>>>        registers::{self, Interrupt},
>>>        RegisterOffset,
>>>    };
>>> @@ -490,20 +490,24 @@ impl PL011State {
>>>        /// location/instance. All its fields are expected to hold unitialized
>>>        /// values with the sole exception of `parent_obj`.
>>>        unsafe fn init(&mut self) {
>>> +        static PL011_OPS: MemoryRegionOps<PL011State> = MemoryRegionOpsBuilder::<PL011State>::new()
>>> +            .read(&PL011State::read)
>>> +            .write(&PL011State::write)
>>> +            .native_endian()
>>
>> Could we always make .valid_sizes() explicit?
> 
> Yes (for example build() could even fail to compile if you don't have
> impl_sizes/valid_sizes set), but why do you want that? I'm not even
> sure that all cases of .valid.max_access_size=4 are correct...

Exactly for that :) Not have implicit default values, so correct
values are reviewed when models are added.


