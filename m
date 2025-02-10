Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1thRJs-0007sA-LY
	for mharc-qemu-rust@gnu.org; Mon, 10 Feb 2025 05:47:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1thRJq-0007r5-BO
 for qemu-rust@nongnu.org; Mon, 10 Feb 2025 05:47:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1thRJo-0006IY-34
 for qemu-rust@nongnu.org; Mon, 10 Feb 2025 05:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739184430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fV+h25DT3pRClfJYLX5gQ85Iys6tkApbGFbQznBmcZc=;
 b=Z5CEdpPnY132gJwettXx36Zyq+sIYpRkk0dEpJ6+85iLdBSpE1pzTdo1LK5Ik2yxW3RfyY
 T/Sqjl3be0EK86uZivvDElZm7E+YUTepXiAkxgU8DC0ZQxre30u9GWYxwb0RGOBgHnlaqI
 +iRYS8RI+rzdBLcya/7gQ5KIAv1P+Qo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-XEXvHtefNziwqtA_vnGmVw-1; Mon, 10 Feb 2025 05:47:08 -0500
X-MC-Unique: XEXvHtefNziwqtA_vnGmVw-1
X-Mimecast-MFC-AGG-ID: XEXvHtefNziwqtA_vnGmVw
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5da0b47115aso4344110a12.1
 for <qemu-rust@nongnu.org>; Mon, 10 Feb 2025 02:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739184427; x=1739789227;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fV+h25DT3pRClfJYLX5gQ85Iys6tkApbGFbQznBmcZc=;
 b=N6mTaiMmphKSykY2JuYtZA+7JVh4bX8Pr9wBX+fAU9+ilvayJHAOpBX7jlUTYZ8KNr
 0T8S6KIv88JURWnqF+bQGx78+K4moebP363OI0Tuvox1B5c2oftGGnuAws4U6UMFRhBM
 QrTtaQN/6+jdjdpceNntS1gCjxhirSMtl0aavdZMu1j/RhfKSdUkNd+1PVz4MdOPCw1G
 mYKk8zx+hnUO996H6EzLvaPej0vqhInUFlDVVZ8GRHSUVS3dMxCm9PjzPn0/e96/HMhp
 RSar9wNvZ3z7QIMGZ6WKY+cblruQcGDi1yYt1X2HcWRQ2INrhNbjhy7QsbudubsiQl/L
 YGPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtIIo9ccsDgL82GIDWiLXBpUz0e2PfHFOFFuYL/Ghwg5h8tuLbSBWh0RPPsvGw2Ikia6ZCAWKPjYc=@nongnu.org
X-Gm-Message-State: AOJu0YxhaCqfQWqof2Zb65+XVmQLE41FSgr7P2Qg1g54hXKXUYXKuXqc
 PGVXt93Tr2vTQ4nzxrvgkzUq0nzQDgW0bzV8QboJglIfZ3M5w1ZIC6OdD6ZF00Qiy8P3CNHkkOx
 5OTW1oJ5USMukLdi+00aLh6h4PC95JE7Kp54R0AYnGctX2ci9z70=
X-Gm-Gg: ASbGncs6snYc4H1LOoixXaJL9cd6cIYaT5qevUdg9e/eblmyO6y/BlxC+4Jh5KEqQY7
 FhPINi1yWwc+LD06VrYBmBepbYpPXrqNnzNKOuxpWE/YIGe2rHVWiNljMfKMtJOlJc06AH9SMUP
 HlwfREQLesCNTrwTi7uMSOqt4/rF02C4PEMTK6daN3MAFikFZQMKqk0Jl03tqPYYH9bdsep31Yp
 uciR64hLZziTFwM7keMR5IX4+n55547oW2HikdZ/wxuiv2nvIeOgvZ6Z+2kYfM85hA27IV/V4i5
 Myv3rA==
X-Received: by 2002:a05:6402:2106:b0:5dc:8fb1:d44d with SMTP id
 4fb4d7f45d1cf-5de450e21aamr12650837a12.31.1739184427373; 
 Mon, 10 Feb 2025 02:47:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI2LYjCJUj/z9hvRNSOPV+xcfU+Gd7sIgA+f8KIi7TwXRW1mXiXr5lhPJWuwCPLFY+ra8kIg==
X-Received: by 2002:a05:6402:2106:b0:5dc:8fb1:d44d with SMTP id
 4fb4d7f45d1cf-5de450e21aamr12650820a12.31.1739184426994; 
 Mon, 10 Feb 2025 02:47:06 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5de5e24dfc9sm4654564a12.34.2025.02.10.02.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 02:47:06 -0800 (PST)
Message-ID: <c7685bff-96d1-4e89-ba19-08fbba399d37@redhat.com>
Date: Mon, 10 Feb 2025 11:47:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: vtables and procedural macros (was Re: [PATCH] rust: pl011: convert
 pl011_create to safe Rust)
To: Zhao Liu <zhao1.liu@intel.com>, Junjie Mao <junjie.mao@hotmail.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, qemu-stable@nongnu.org
References: <20250206111514.2134895-1-pbonzini@redhat.com>
 <20250206111514.2134895-2-pbonzini@redhat.com> <Z6nOAftJsjQ7KAiS@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z6nOAftJsjQ7KAiS@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aQD3ncBD5v2bnONlIg9V3VdRig_M40Wb4xlxoAVbr38_1739184427
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 10 Feb 2025 10:47:14 -0000

On 2/10/25 10:59, Zhao Liu wrote:
> On Thu, Feb 06, 2025 at 12:15:14PM +0100, Paolo Bonzini wrote:
>> Date: Thu,  6 Feb 2025 12:15:14 +0100
>> From: Paolo Bonzini <pbonzini@redhat.com>
>> Subject: [PATCH] rust: pl011: convert pl011_create to safe Rust
>> X-Mailer: git-send-email 2.48.1
>>
>> Not a major change but, as a small but significant step in creating
>> qdev bindings, show how pl011_create can be written without "unsafe"
>> calls (apart from converting pointers to references).
>>
>> This also provides a starting point for creating Error** bindings.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   rust/hw/char/pl011/src/device.rs | 39 ++++++++++++++++----------------
>>   rust/qemu-api/src/sysbus.rs      | 34 +++++++++++++++++++++++++---
>>   2 files changed, 50 insertions(+), 23 deletions(-)
> 
> ...
> 
>> +    fn realize(&self) {
> 
> What about renaming this as "realize_with_sysbus"?
> 
> Elsewhere, the device's own realize method is often used to set
> DeviceImpl::REALIZE.

I *think* this is not a problem in practice because trait methods are 
public (if the trait is in scope) whereas the device's realize method if 
private.

I agree that the naming conflict is unfortunate though, if only because 
it can cause confusion.  I don't know if this can be solved by 
procedural macros; for example a #[vtable] attribute that changes

     #[qemu_api_macros::vtable]
     fn realize(...) {
     }

into

     const fn REALIZE: ... = Some({
         fn realize(...) {
         }
         realize
     }

This way, the REALIZE item would be included in the "impl DeviceImpl for 
PL011State" block instead of "impl PL011State".  It's always a fine line 
between procedural macros cleaning vs. messing things up, which is why 
until now I wanted to see what things look like with pure Rust code; but 
I guess now it's the time to evaluate this kind of thing.

Adding Junjie since he contributed the initial proc macro infrastructure 
and may have opinions on this.

Paolo


