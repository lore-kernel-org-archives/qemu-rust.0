Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tLhMb-00032D-8q
	for mharc-qemu-rust@gnu.org; Thu, 12 Dec 2024 06:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLhMZ-00031k-QW
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 06:28:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLhMX-0001GP-0n
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 06:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734002887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1cbVtSCNqR4lsvh+JjM+Bc/gVcHF93W/WF+OcqQvvNg=;
 b=CppSVaoP43bavXp/ushkaBGtYoWgMJ2pE0tWT1nq98C71Q4d0BiYYIIuF4lUd+hgS7lNzb
 X8XZeq7W/SBNmiSFOHezU78yu8y9yOpxYqeVS0H+xWa1I/gM3lbm3AMEtvftcvR7QYaGWY
 igCJpMBwy69NKn61byNrqid+YvyxRq4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-3t5qd1jVMHW-LcZnP1CtPQ-1; Thu, 12 Dec 2024 06:28:06 -0500
X-MC-Unique: 3t5qd1jVMHW-LcZnP1CtPQ-1
X-Mimecast-MFC-AGG-ID: 3t5qd1jVMHW-LcZnP1CtPQ
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3862f3ccf4fso201777f8f.0
 for <qemu-rust@nongnu.org>; Thu, 12 Dec 2024 03:28:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734002885; x=1734607685;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1cbVtSCNqR4lsvh+JjM+Bc/gVcHF93W/WF+OcqQvvNg=;
 b=HOVbA5r3y1FOyvDkyQpoulS/sQMEH+TmpAq36ggn7WBhDjM3H5nXNkuVbbkvrotmBM
 RSv3V+hCKa90fO2s/YFBayguETy1PGRW3/UAHR+d0Ec5d2s8SvDBjAPD29dIX/+RNcB3
 V02XKYCzc1ttmZkwq07k0R+9m55JMc8jHCGk2ab8rH2RW+mgId7U6PZHB6E6zo4IFLVe
 8WE7mzHL6Lvp0zS3f3RVh5ESnmar0/bHDqfRVYWoVR1sdcoXBZNuepkqSeCrpDahYb6u
 HtRC6jHVp0jAPU7sGH3LhgfUF1PYPOLpV/KvcA0VvxLP/J4s7SuPjAlMI4BBlXPQEMse
 DGfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRKIokoy69eqwcA3Hd01yT9rrFYAz/U36lIb8DMgFV1YncCNHH4SP3fgbgFBtrM//HSmYiuQdprSE=@nongnu.org
X-Gm-Message-State: AOJu0Yw7uls1iAz8LlNtaE4feb91tQ6ve4iVTJeEvygr9gwMGq3ZdfD/
 2TcL91IrJ/ENVkqMxo1UiIgmn3WqE8IXM9ypYMxH+ocA5YtAPEYlTJxq3+D9ihm47x069Ztqd8S
 TrHHcXW5CmlRDq6OJn1D1/98Cqc+iYKzinbDuJRR9SpPtA9v/5qM=
X-Gm-Gg: ASbGncvZNgJpTOunywik+dXQTNPN40OkZUFO145PXhAx4ZI1U/Tmnogap8OXRBGlHwU
 znoxeq/LDR8omXDtLZVPoAQjJQl27nPEF9D2RcO59R289xHmhx5eRzAFeIv/FLF27IHGo577uLo
 WPVlkUIhIllV6sIuXnarZr2KARriBvqBHvjnG5RdsnQv6V2KwznuAjmQHC6+LfN6UkDZpGHFnJy
 BKaH0dsmmA1p8zeuXdCcQV3dGmEGHHD98zCk1gstxTtruxQqy1d8ZjE/Ln7
X-Received: by 2002:a05:6000:a18:b0:386:3cfa:62ad with SMTP id
 ffacd0b85a97d-38787685668mr2506209f8f.1.1734002884947; 
 Thu, 12 Dec 2024 03:28:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHunw5p82l3r6A9jJJXorOG2M3a1xQJ6hI7FnafG25QUIjmNCYqvO6y7i7lkX8Ka5lSLwwizw==
X-Received: by 2002:a05:6000:a18:b0:386:3cfa:62ad with SMTP id
 ffacd0b85a97d-38787685668mr2506193f8f.1.1734002884565; 
 Thu, 12 Dec 2024 03:28:04 -0800 (PST)
Received: from [192.168.10.27] ([151.81.118.45])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-387824a4d19sm3764507f8f.32.2024.12.12.03.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 03:28:03 -0800 (PST)
Message-ID: <a0bdbf2a-8430-480e-bc56-e8a4875dd577@redhat.com>
Date: Thu, 12 Dec 2024 12:28:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/26] rust: rename qemu-api modules to follow C code a
 bit more
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Junjie Mao <junjie.mao@hotmail.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
 <20241209123717.99077-20-pbonzini@redhat.com> <Z1qyeThRA8yJMMoM@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z1qyeThRA8yJMMoM@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0lgXZX6pWY1P5ofjc0-r3ALMZnaCsXzkIvqCIu9FU1E_1734002885
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 12 Dec 2024 11:28:12 -0000

On 12/12/24 10:52, Zhao Liu wrote:
> On Mon, Dec 09, 2024 at 01:37:10PM +0100, Paolo Bonzini wrote:
>> Date: Mon,  9 Dec 2024 13:37:10 +0100
>> From: Paolo Bonzini <pbonzini@redhat.com>
>> Subject: [PATCH 19/26] rust: rename qemu-api modules to follow C code a bit
>>   more
>> X-Mailer: git-send-email 2.47.1
>>
>> A full match would mean calling them qom::object and hw::core::qdev.  For now,
>> keep the names shorter but still a bit easier to find.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   rust/hw/char/pl011/src/device.rs              |  4 +-
>>   rust/qemu-api-macros/src/lib.rs               |  2 +-
>>   rust/qemu-api/meson.build                     |  5 +-
>>   rust/qemu-api/src/lib.rs                      |  5 +-
>>   rust/qemu-api/src/module.rs                   | 43 +++++++++++
>>   rust/qemu-api/src/prelude.rs                  |  2 +-
>>   .../qemu-api/src/{device_class.rs => qdev.rs} |  4 +-
>>   rust/qemu-api/src/{definitions.rs => qom.rs}  | 74 +++++++++----------
>>   rust/qemu-api/src/sysbus.rs                   |  2 +-
>>   rust/qemu-api/tests/tests.rs                  |  5 +-
>>   10 files changed, 92 insertions(+), 54 deletions(-)
>>   create mode 100644 rust/qemu-api/src/module.rs
>>   rename rust/qemu-api/src/{device_class.rs => qdev.rs} (97%)
>>   rename rust/qemu-api/src/{definitions.rs => qom.rs} (83%)
>>
>> --- a/rust/qemu-api/src/definitions.rs
>> +++ b/rust/qemu-api/src/qom.rs
>> @@ -2,7 +2,37 @@
>>   // Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>   // SPDX-License-Identifier: GPL-2.0-or-later
>>   
>> -//! Definitions required by QEMU when registering a device.
>> +//! Bindings to access QOM functionality from Rust.
>> +//!
>> +//! This module provides automatic creation and registration of `TypeInfo`
>> +//! for classes that are written in Rust, and mapping between Rust traits
>> +//! and QOM vtables.
>> +//!
>> +//! # Structure of a class
>> +//!
>> +//! A concrete class only needs a struct holding instance state. The struct must
>> +//! implement the [`ObjectType`] and [`IsA`] traits, as well as any `*Impl`
>> +//! traits provided by its superclasses.
> 
> In this commit, this comment is a bit ahead, but I think it's okay.
> 
> qom and qdev are both good names. In addition, we can rename the files
> of PL011 as well. Perhaps device_class.rs could be merged into device.rs
> (and eventually renamed to pl011.rs). I guess you might be planning to
> keep it until the cleanup of vmstate and property is done.

Yeah, I don't have any specific plans but memory_ops will certainly go 
away.  device_class doesn't do much, but keeping it separate is a 
reminder for things that are still there to be cleaned up.

As to VMState, there are two parts.  One is the vmstate_description 
macro, probably it has to be replaced with something else to incorporate 
the trampolines for pre_save/post_load/...  I haven't looked at it but 
it should not be a lot of work.

The second is VMStateFields, for which my idea is to implement a trait 
on types to retrieve a basic VMStateField (for example something like 
vmstate_uint32 would become an implementation of the VMState trait on 
u32).  Then you'd write something like "vmstate_of!(Type, 
field).with_version_id(2)" (i.e. vmstate_of retrieves the basic field 
and fills in the offset, then you apply more changes on top).  But that 
may take a while, and I think it cannot be done without the 
const_refs_to_static feature, which is only stable in 1.83.0.

Paolo


