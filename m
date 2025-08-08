Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861D0C87FD3
	for <qemu-rust@archiver.kernel.org>; Fri,  8 Aug 2025 08:19:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ukIJK-0006VA-Dy; Fri, 08 Aug 2025 04:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ukIId-0005zW-W4
 for qemu-rust@nongnu.org; Fri, 08 Aug 2025 04:18:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ukIIb-0007vD-TW
 for qemu-rust@nongnu.org; Fri, 08 Aug 2025 04:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754641080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=USyOz6dIxmzT79afywxwNHFLNVQONRr9+3TPPFDeby0=;
 b=hWoovAdVb4sL/ELs+M206YRwMxzVl+ghq2hBFcmPF84441m7Zxrh5bnAvZ0z4SHj1nhF/X
 wVxE0HIJJMqsFziXL6OdIROSbCeFtlcuuGXZWEo+XX/SEBioRQCzL6yMCV2tteBOPrBpw6
 QW6okC1vN/NzNFl/EvsKWb7z/p2Rn9A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-GYIXQenQNsWKCDFLdq_Vrw-1; Fri, 08 Aug 2025 04:17:56 -0400
X-MC-Unique: GYIXQenQNsWKCDFLdq_Vrw-1
X-Mimecast-MFC-AGG-ID: GYIXQenQNsWKCDFLdq_Vrw_1754641075
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-459e30eeea3so11251495e9.0
 for <qemu-rust@nongnu.org>; Fri, 08 Aug 2025 01:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754641075; x=1755245875;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=USyOz6dIxmzT79afywxwNHFLNVQONRr9+3TPPFDeby0=;
 b=h1Qv8UiJLIZOhxjcWGAK9/4kacwM2UBSKTPeN7I1g6VuQyiYeemEMAyaVjylkDHUjU
 VImph8YgTIFxSTxyStXslQAKVVuR3WGldSfHGx8EWXOLVjZt2WZ1ikgNOxgtUPuqzg+Q
 DzBd+zV5LMyHQRXAUfiTRbqoGK2AV+l9tyumptnnvet5yN6/BaUYLfD5rUIUKY6nhTUL
 HHSJ9R37Rv5Gum7QSHRSGpyKRqX/T3LOTOMFH72hdMT/GGmrnbSfDr0hOvBNsbHdedA4
 y8vj9pk7tP1plCAZvBXa/fJLKhhwjO+sqgvqyg9UzUp+yobP09n1LUdG0935G0ioERwT
 lGgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWH8a5BO7K8Qqi6edNXSWV30SPsAIyv1vNOeVWKZDUtyufMag6RCDD5EReH1ULTWZ1tTjSOTpjwTQ=@nongnu.org
X-Gm-Message-State: AOJu0YywbqZ19KIyAsNnAAiaqBOZSZSR5WDdSgvoxiK/kduufj4Kvzer
 /WzNeJrmF3x2FV+Vw18qOm7kcT6kIlxvCtilJLzWhGEO+L8rdYiktZovAOZwJXVx8fHgRNvBLdi
 /VhRWYSPxhCyJuyFHvVF12/mi5yPUcRygMqGYI8alqdH/8ztYD7vlmQg=
X-Gm-Gg: ASbGncsI/BLuf7bA8/J+FQwf2WVrLzsIvEZDb2hniO5J+6Lu8zAPeRPZsT9Og9cuFdk
 cfDdYOzz0w1HDiS2/IV1r8KaZEjBAVqjIsxAnVUWq5jUc9/DyzowaMnGMHfk8T6EzumFxyxzRcR
 TVQpK24tmW6air4Iy5VPsQ9HQ4qrrBuPZfj0lXo0VDTbTrHGkRRNYcGwhPI/VPoQsacnkMdlyH0
 /zWM/qpuV9dXSXKrxnN43yw+wim0NF3I2ffzS/uSeNQvTs2X8xxLiyMtahzBvWAUeMvWY73U759
 J2W5fVHc1Mk59r/98sllMehBC7AkPEnHYBoU0txfSmroPzGntjOMnQKlzIKlY6y6ykKRFjiO
X-Received: by 2002:a05:600c:1c92:b0:453:66f:b96e with SMTP id
 5b1f17b1804b1-459f4eb9fbbmr14175755e9.11.1754641075309; 
 Fri, 08 Aug 2025 01:17:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEMa4Btk7p4Qm2NjR5tmGGKCSishBs8HxYZGNSGmlA+AIZKwgChk4WS259idlAQbT/mBqAZQ==
X-Received: by 2002:a05:600c:1c92:b0:453:66f:b96e with SMTP id
 5b1f17b1804b1-459f4eb9fbbmr14175495e9.11.1754641074790; 
 Fri, 08 Aug 2025 01:17:54 -0700 (PDT)
Received: from [10.170.62.123] (93-33-81-67.ip43.fastwebnet.it. [93.33.81.67])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453333sm30540251f8f.45.2025.08.08.01.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 01:17:54 -0700 (PDT)
Message-ID: <d3cf543f-c0aa-421e-8151-b554e77aaa40@redhat.com>
Date: Fri, 8 Aug 2025 10:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 10/26] subprojects/vm-memory: Patch vm-memory for QEMU
 memory backend
To: Zhao Liu <zhao1.liu@intel.com>, Hanna Reitz <hreitz@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Junjie Mao <junjie.mao@hotmail.com>,
 qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>
References: <20250807123027.2910950-1-zhao1.liu@intel.com>
 <20250807123027.2910950-11-zhao1.liu@intel.com>
 <d144ae17-afe3-4578-a875-79c1d6a4d723@redhat.com>
 <aJWyt+4JRzqhfIzU@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <aJWyt+4JRzqhfIzU@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dVb2PPKxAK0ITo-PgNHHk2WrAq44f4pFk0VnTJVAk7w_1754641075
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/8/25 10:17, Zhao Liu wrote:
> (+Hanna: I would like to align with Hanna on 0002.diff patch :-))
> 
> On Thu, Aug 07, 2025 at 03:59:26PM +0200, Paolo Bonzini wrote:
>> Date: Thu, 7 Aug 2025 15:59:26 +0200
>> From: Paolo Bonzini <pbonzini@redhat.com>
>> Subject: Re: [RFC 10/26] subprojects/vm-memory: Patch vm-memory for QEMU
>>   memory backend
>>
>> On 8/7/25 14:30, Zhao Liu wrote:
>>> Add 2 patches to support QEMU memory backend implementation.
>>>
>>> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>>> ---
>>>    .../packagefiles/vm-memory-0.16-rs/0001.diff  |  81 +++++++++++++
>>>    .../packagefiles/vm-memory-0.16-rs/0002.diff  | 111 ++++++++++++++++++
>>>    subprojects/vm-memory-0.16-rs.wrap            |   2 +
>>>    3 files changed, 194 insertions(+)
>>>    create mode 100644 subprojects/packagefiles/vm-memory-0.16-rs/0001.diff
>>>    create mode 100644 subprojects/packagefiles/vm-memory-0.16-rs/0002.diff
>>>
>>> diff --git a/subprojects/packagefiles/vm-memory-0.16-rs/0001.diff b/subprojects/packagefiles/vm-memory-0.16-rs/0001.diff
>>> new file mode 100644
>>> index 000000000000..037193108d45
>>> --- /dev/null
>>> +++ b/subprojects/packagefiles/vm-memory-0.16-rs/0001.diff
>>> @@ -0,0 +1,81 @@
>>> +From 298f8ba019b2fe159fa943e0ae4dfd3c83ee64e0 Mon Sep 17 00:00:00 2001
>>> +From: Zhao Liu <zhao1.liu@intel.com>
>>> +Date: Wed, 6 Aug 2025 11:31:11 +0800
>>> +Subject: [PATCH 1/2] guest_memory: Add a marker tarit to implement
>>> + Bytes<GuestAddress> for GuestMemory
>>
>> This was a bit surprising.  Maybe this is something where GuestMemory needs
>> some extra flexibility.
> 
> At least, the default GuestMemory::try_access() need to re-implement in
> QEMU, and this is because GuestMemory::iter() doesn't fit for QEMU's
> case, and GuestMemory::to_region_addr() also needs adjustment to support
> complete translation.
> 
> For details,
> 
> 1) iter() - QEMU has implemented the two-level "page" walk in
>     `phys_page_find`, which is more efficient than linear iteration.
> 
> 2) to_region_addr() - it's function signature is:
> 
>      fn to_region_addr(
>          &self,
> 	addr: GuestAddress
>      ) -> Option<(&Self::R, MemoryRegionAddress)>;
> 
> but QEMU currentlt wants:
> 
>      fn translate(
>          &self,
>          addr: GuestAddress,
>          len: GuestUsize,
>          is_write: bool,
>      ) -> Option<(&MemoryRegionSection, MemoryRegionAddress, GuestUsize)>
> 
> `is_write` is mainly about IOMMU (and read-only case, but that could be
> workaround I think).
> 
> And the 3rd member `GuestUsize` of (&MemoryRegionSection,
> MemoryRegionAddress, GuestUsize) indicates the remianing size, which is
> used to detect cross-region case. Maybe this `GuestUsize` is not
> necessary in its return, since we can check the size of `MemoryRegionSection`
> later. But this would be a bit repetitive.
> 
> But at least, this marker trait is acceptable, right? :-)
> 
> The marker trait for GuestMemoryRegion is introduced at commit 66ff347
> ("refactor: use matches! instead of to_string() for tests").
> 
>>> @@ -0,0 +1,111 @@
>>> +From 2af7ea12a589fde619690e5060c01710cb6f2e0e Mon Sep 17 00:00:00 2001
>>> +From: Zhao Liu <zhao1.liu@intel.com>
>>> +Date: Wed, 6 Aug 2025 14:27:14 +0800
>>> +Subject: [PATCH 2/2] guest_memory: Add is_write argument for
>>> + GuestMemory::try_access()
>>
>> This should be fine.  But Hanna is also working on IOMMU so maybe this won't
>> be needed!
> 
> I'm not sure what method could align with Hanna's design. If there's
> another interface/method, I can have a try.

For example she already has similar fixes in 
https://github.com/rust-vmm/vm-memory/pull/327:

https://github.com/rust-vmm/vm-memory/pull/327/commits/9bcd5ac9b9ae37d1fb421f86f0aff310411933af
    Bytes: Fix read() and write()

    read() and write() must not ignore the `count` parameter: The
    mappings passed into the `try_access()` closure are only valid for up
    to `count` bytes, not more.

https://github.com/rust-vmm/vm-memory/pull/327/commits/2b83c72be656e5d46b83cb3a66d580e56cf33d5b
     Bytes: Do not use to_region_addr()

     When we switch to a (potentially) virtual memory model [...]
     the one memory-region-referencing part we are going to keep is
     `try_access()` [...] switch `Bytes::load()` and `store()` from using
     `to_region_addr()` to `try_access()`.

With some luck, your custom implementation of Bytes<GuestAddress> is not 
needed once vm-memory supports iommu.

Paolo


