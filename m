Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tmrXs-0007VX-0Q
	for mharc-qemu-rust@gnu.org; Tue, 25 Feb 2025 04:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tmrXo-0007Uu-E8
 for qemu-rust@nongnu.org; Tue, 25 Feb 2025 04:48:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tmrXm-0006Em-Ms
 for qemu-rust@nongnu.org; Tue, 25 Feb 2025 04:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740476879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FuEsIP2O2tHJNVHhmve8zpwX/Sq5q/QV/BFBiFtj7iM=;
 b=ikLae7f7F4S2VCFVhJdQw+J9UrRvVGh4j6otgp/imP9wXhw5BvusrlI9sbAdRC8d0m44K4
 tykrZiiYGb8V1yeCzD+viz+wvqSzUSFwDrG+lsm/R/Wytk5G5f4AB5EVcucMN+5Qq1U1RR
 aivCIEDjMcLjoDznYUQDGvacYlPBg04=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-uS0eioowMy2GHbwhzF6tXw-1; Tue, 25 Feb 2025 04:47:58 -0500
X-MC-Unique: uS0eioowMy2GHbwhzF6tXw-1
X-Mimecast-MFC-AGG-ID: uS0eioowMy2GHbwhzF6tXw_1740476877
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5d9e4d33f04so5503141a12.0
 for <qemu-rust@nongnu.org>; Tue, 25 Feb 2025 01:47:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740476876; x=1741081676;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FuEsIP2O2tHJNVHhmve8zpwX/Sq5q/QV/BFBiFtj7iM=;
 b=ghIo5lL4t//YAkiuTggXbZfXt+vU2mzK2jLLlJYm0f8sR57uPN9CoxEkOCuz47v8ZC
 saPOZjdoS2kIeJytgv2y4rBH2dK+ZyiHr0A1ujrs+8XYhIzSeNyFr637UvwbB33Pw7sH
 z6v6NdcXaoZZjeyVXK//zSzF/Qbw4P78kMPD6zG9bFPYZivkXlLMzBxsNo7gMIDaV2GL
 jKvhZzYhRm9dkRFOteLI/ojrs+XSkWdQ05pQNteFNj7ZBpOzI0pqq/XNUnahy/OLT+pK
 qEhDxk52V5WOMAUO3oYuptantrE/56bYTyGrbXywQBsEy/16oItLIWXwcs0/19Nln4FI
 VXCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIenCu7l85aIpp2V2GfGVQMt3ktUh/H/ZHgNLoU2d70Gk5N5Csw5qzu/kjVlCxdJFWmFMd9PqQI7s=@nongnu.org
X-Gm-Message-State: AOJu0Yx/bmL4n4PJFRq+Koo1Oqw2YLE6WlPIWTeHcdI/6ILKUjL/WuFp
 /waQ15ini+24lxoyeJxduzsPqSObk0jaL9RMAaIVS17l2psKIhQ335d/M+GMxn6x9yvIyXoK+Ma
 +FHahZV/91AL/bGKVzFEdg5yesZOb03/JcAVsSd/ax/789a42WouuMdjllJxHlQ==
X-Gm-Gg: ASbGncvANrUHV5l35VzBBdmszkt4eki65PYcavo+5eyN6jeIzqghGBY6zgjGX3Tejdf
 GCxS4Tzfib7hwPkVGXbujt1zmXTAPDB1QRC2CMjhdjhNNxM+O8JmhEbXJOLseu/G6QEWHnkT0Lb
 uN4F4HDWuwpQ03khnSiYc4zgl2SvdO4mP10W4FvHDLOIKl76zpoHRIwN8KCqCFHne5+m4FcEo6X
 5xMNnefkDQhFAC3vrFYy0dot44Pd6SuWiWCTHWCefrW8TGAcJsKaDFcQHBwPpW9gnG4ftqT25t2
 vs6bWE1l3A7MCvQZG1cz
X-Received: by 2002:a17:907:970c:b0:abb:d047:960b with SMTP id
 a640c23a62f3a-abc0d9885e7mr1604099366b.4.1740476876597; 
 Tue, 25 Feb 2025 01:47:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWdwPduhCddhpakC5v8+D3m0cQ7xXzdB61AhMDe7Z3CI9hZ/EDBsukneiOUMGg2Yk1X8wtgA==
X-Received: by 2002:a17:907:970c:b0:abb:d047:960b with SMTP id
 a640c23a62f3a-abc0d9885e7mr1604097066b.4.1740476876197; 
 Tue, 25 Feb 2025 01:47:56 -0800 (PST)
Received: from [192.168.10.81] ([176.206.102.52])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-abed1cdb131sm111407066b.7.2025.02.25.01.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 01:47:55 -0800 (PST)
Message-ID: <3ef9ff7a-570d-4cde-a555-8415a07ccdd5@redhat.com>
Date: Tue, 25 Feb 2025 10:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] rust: memory: wrap MemoryRegion with Opaque<>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250221170342.63591-1-pbonzini@redhat.com>
 <20250221170342.63591-14-pbonzini@redhat.com> <Z72J4uLSPvFBbpyz@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z72J4uLSPvFBbpyz@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SZyT02Hoh8c2O7zvpHKEO-kfnWWm7kGEi-RnHg_vS7g_1740476877
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 25 Feb 2025 09:48:05 -0000

On 2/25/25 10:14, Zhao Liu wrote:
>>   impl MemoryRegion {
>>       // inline to ensure that it is not included in tests, which only
>> @@ -174,13 +174,15 @@ pub fn init_io<T: IsA<Object>>(
>>           size: u64,
>>       ) {
>>           unsafe {
>> -            Self::do_init_io(&mut self.inner, owner.cast::<Object>(), &ops.0, name, size);
>> +            Self::do_init_io(
>> +                self.0.as_mut_ptr(),
> 
> I'm not sure why the wrapper doesn't work here.
> 
> If I change this to `self.as_mut_ptr()`, then compiler tries to apply
> `ObjectDeref::as_mut_ptr` and complains:
> 
> the trait `qom::ObjectType` is not implemented for `bindings::MemoryRegion`

It's because the implementation of ObjectDeref for "&mut MemoryRegion" 
wins over coercing "&mut MemoryRegion" to "&MemoryRegion" and then 
calling MemoryRegion::as_mut_ptr().

I added a comment

         // self.0.as_mut_ptr() needed because Rust tries to call
         // ObjectDeref::as_mut_ptr() on "&mut Self", instead of coercing
         // to "&Self" and then calling MemoryRegion::as_mut_ptr().
         // Revisit if/when ObjectCastMut is not needed anymore; it is
         // only used in a couple places for initialization.

Paolo

> 
> But when I modify the function signature to &self like:
> 
> diff --git a/rust/qemu-api/src/memory.rs b/rust/qemu-api/src/memory.rs
> index fdb1ea11fcf9..a82348c4a564 100644
> --- a/rust/qemu-api/src/memory.rs
> +++ b/rust/qemu-api/src/memory.rs
> @@ -167,7 +167,7 @@ unsafe fn do_init_io(
>       }
> 
>       pub fn init_io<T: IsA<Object>>(
> -        &mut self,
> +        &self,
>           owner: *mut T,
>           ops: &'static MemoryRegionOps<T>,
>           name: &'static str,
> 
> Then the Wrapper's as_mut_ptr() can work.
> 
>> +                owner.cast::<Object>(),
>> +                &ops.0,
>> +                name,
>> +                size,
>> +            );
>>           }
>>       }
>> -
>> -    pub(crate) const fn as_mut_ptr(&self) -> *mut bindings::MemoryRegion {
>> -        addr_of!(self.inner) as *mut _
>> -    }
>>   }
>>   
>>   unsafe impl ObjectType for MemoryRegion {
>> -- 
>> 2.48.1
>>
>>
> 
> 


