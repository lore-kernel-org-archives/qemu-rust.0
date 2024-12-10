Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tL4C6-00008F-4C
	for mharc-qemu-rust@gnu.org; Tue, 10 Dec 2024 12:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tL4C1-0008Nz-VD
 for qemu-rust@nongnu.org; Tue, 10 Dec 2024 12:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tL4C0-0005w4-4d
 for qemu-rust@nongnu.org; Tue, 10 Dec 2024 12:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733852318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EBjokO9RvuNIEF2VRfNWcKbPAsjcPOD01MJwzzn+qtA=;
 b=QUEVYQjb4dQXOQyKqMOBxN3NLoeN5ASaZw9AU9FB0UuKQPV6XwjBsapgm9U5q8VFCz0jMV
 72yKOXXnDM6zdDGtlRKh04CXwa8fsaCeQm2uAr/v840ESDUA8bE1zeVIz4A9KQ6lBxEFVu
 CsrpOnzcZ4Kmpj1hxr9oNKwcXV5Xtbw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-ZCZumSfBPKqZdlDh4o7wbw-1; Tue, 10 Dec 2024 12:38:37 -0500
X-MC-Unique: ZCZumSfBPKqZdlDh4o7wbw-1
X-Mimecast-MFC-AGG-ID: ZCZumSfBPKqZdlDh4o7wbw
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-434ed70b74eso27715745e9.1
 for <qemu-rust@nongnu.org>; Tue, 10 Dec 2024 09:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733852316; x=1734457116;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EBjokO9RvuNIEF2VRfNWcKbPAsjcPOD01MJwzzn+qtA=;
 b=k/EhEz0qRu4QVrFNo5Cyo9h2+J+GmEW8dgEyTIl+jEOqzXq6pp73UiIawcjamUn7Ub
 RKrUyM2CyHY/3F2rDmtajlapbkdRphfhfJgnXH29DnaL8dABmccKrGMvHC8l/uHEbhAS
 v01MDDEMbtgGz/sBDHftjFeAzlHelqSrQImm3xmO8rMe9vtAixfvA3w63DSO9njT59bt
 SEdPC6dIrXhFyyPDYiB5BzAD27g6zGZCOvgsONgmbepHSYHgR66Cbe/LXnFQILvMJKry
 ubm9ZHNPPC0yRqzebMGII5uy5xTgfnyTzGPu3laIdE7W/Bf7L830bPGdeHKUqR2xhQ9C
 q4aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC2Q5EuO5Tizn9ewT5J7ovyxphKra+nRLtcOOR2ej+9MFLhrpx19+Cv6TKzc5u18G2uAZR2Dk+c30=@nongnu.org
X-Gm-Message-State: AOJu0YzMOd2DicLQjm1GP9wvn89OHgAzoq/PRAuVYu78ZQGPG63dqPVe
 7l4KHj1fZ1uVqV8N9ccTA8PDczVpOs7HQ58RYQ+3ZZ0B1pfbQY0QuFS1/2u69wKVWIGw3npzfGM
 DP6TnwUjRLJwQoQKEluYIpIOUMUfW7xAGVtellRrxeS8DuHBFpv8=
X-Gm-Gg: ASbGnctxZlsqG4nxQyNpp+4LcVqWfdmyzxjM/ZhWbghXbLt/QStKRFNw8zLDvBxCyeF
 PE7lRqsiH+sO2BEpJRWtT00ldBOO3ONYIHuN5Iig8/0v7JIGxl1RMV2vtIT7y83apSaNUX1YWny
 tAezruez6YlC82tj6T8vhEPy2V4LAcc+qr8br6UWcLC32ZGrIa13d219o6kj7K1LTdPi2ukvtqc
 0ScgedmmEkdl5DLjwoE+pUNql1IzjnYf/rZijy1i6Ic8qsNvBvYRXFL6w==
X-Received: by 2002:a05:600c:3783:b0:434:f5c0:3288 with SMTP id
 5b1f17b1804b1-434f5c03c29mr76445085e9.29.1733852315978; 
 Tue, 10 Dec 2024 09:38:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEz6HxhmXQaWWV2iGAldnT6ikNtoXfXXfalQmaNGnqxhCmEBkH4fybTIHmgdrXRlSXgv94YGg==
X-Received: by 2002:a05:600c:3783:b0:434:f5c0:3288 with SMTP id
 5b1f17b1804b1-434f5c03c29mr76444875e9.29.1733852315590; 
 Tue, 10 Dec 2024 09:38:35 -0800 (PST)
Received: from [192.168.10.28] ([151.81.118.45])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-434ea285b57sm123232715e9.37.2024.12.10.09.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 09:38:35 -0800 (PST)
Message-ID: <ada60844-546a-42ca-a05f-7b6dc225ff53@redhat.com>
Date: Tue, 10 Dec 2024 18:38:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/26] rust: qom: move bridge for TypeInfo functions out
 of pl011
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Junjie Mao <junjie.mao@hotmail.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
 <20241209123717.99077-15-pbonzini@redhat.com> <Z1hjX+5Yyi46N+sX@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z1hjX+5Yyi46N+sX@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vdt7SNi9OQER-q1gwmp6czoI_v0ayJnu8OKjfefs0U8_1733852316
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.52,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Tue, 10 Dec 2024 17:38:43 -0000

On 12/10/24 16:50, Zhao Liu wrote:
> On Mon, Dec 09, 2024 at 01:37:05PM +0100, Paolo Bonzini wrote:
>> Date: Mon,  9 Dec 2024 13:37:05 +0100
>> From: Paolo Bonzini <pbonzini@redhat.com>
>> Subject: [PATCH 14/26] rust: qom: move bridge for TypeInfo functions out of
>>   pl011
>> X-Mailer: git-send-email 2.47.1
>>
>> Allow the ObjectImpl trait to expose Rust functions that avoid raw
>> pointers (though INSTANCE_INIT for example is still unsafe).
>> ObjectImpl::TYPE_INFO adds thunks around the functions in
>> ObjectImpl.
>>
>> While at it, document `TypeInfo`.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   rust/hw/char/pl011/src/device.rs | 40 +++++++--------------
>>   rust/qemu-api/src/definitions.rs | 61 +++++++++++++++++++++++++++++---
>>   2 files changed, 69 insertions(+), 32 deletions(-)
>>
>> diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
>> index 56403c36609..b9f8fb134b5 100644
>> --- a/rust/hw/char/pl011/src/device.rs
>> +++ b/rust/hw/char/pl011/src/device.rs
>> @@ -110,7 +110,7 @@ impl ObjectImpl for PL011State {
>>       type Class = PL011Class;
>>       const TYPE_NAME: &'static CStr = crate::TYPE_PL011;
>>       const PARENT_TYPE_NAME: Option<&'static CStr> = Some(TYPE_SYS_BUS_DEVICE);
>> -    const INSTANCE_INIT: Option<unsafe extern "C" fn(obj: *mut Object)> = Some(pl011_init);
>> +    const INSTANCE_INIT: Option<unsafe fn(&mut Self)> = Some(Self::init);
> 
> No need to keep `unsafe` here?

Right now instance_init is called with only the parent initialized, and 
the remaining memory zeroed; its purpose is to prepare things for 
instance_post_init which can then be safe (it's also kind of wrong for 
instance_post_init to receive a &mut Self, because instance_init will 
create other pointers to the object, for example in a MemoryRegion's 
"parent" field).

The right thing to do would be to have an argument of type &mut 
MaybeUninit<Self>.  Then the caller would do something like

     let maybe_uninit = obj as *mut MaybeUninit<Self>;
     unsafe {
         Self::INSTANCE_INIT(&mut *maybe_uninit);
         maybe_uninit.assume_init_mut();
     }

Note however that INSTANCE_INIT would still be unsafe, because its 
safety promise is that it prepares things for the caller's 
assume_init_mut().

The way that this will become safe is to use the pinned_init crate from 
Linux: instance_init returns the initialization as an "impl 
PinInit<Self>", and then instance_post_init can run with a &self.  Until 
then, however, instance_init has to remain unsafe.

Paolo


