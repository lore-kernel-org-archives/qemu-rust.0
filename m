Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tfxyc-000297-86
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 04:15:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tfxyb-00028q-03
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 04:15:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tfxyY-0000on-FB
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 04:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738833309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ck5pHNlWbPCdOaRHfBHS29iNW6Uvcw/3rUs9uaK9ydk=;
 b=R5b16h/IzWuAJrxHY+nDYMABrg+6n7bI4g7aQRvccEAScZCgmUkVM5L6Iwk/H9W36MuhJi
 Dahsw+7IjBPp/SmWKjXrx26kZz+sIW1GOuKlx/M7KB3tyFUUp57Dtqw0QmlCiMTsuTv5fR
 A0JrrHcAwDjbNxYQxl3q9wSD/hLR54U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-49DoM4PxMyOk0Ql1XkH4mQ-1; Thu, 06 Feb 2025 04:15:08 -0500
X-MC-Unique: 49DoM4PxMyOk0Ql1XkH4mQ-1
X-Mimecast-MFC-AGG-ID: 49DoM4PxMyOk0Ql1XkH4mQ
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5d3f01eeef8so661314a12.0
 for <qemu-rust@nongnu.org>; Thu, 06 Feb 2025 01:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738833306; x=1739438106;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ck5pHNlWbPCdOaRHfBHS29iNW6Uvcw/3rUs9uaK9ydk=;
 b=WsTlCSeX2DtXYbioL7cIRiiCMNsIzgVSQ9Md0NToFLBiYeC9W+nnPWIp/CB61riSgI
 zULgYRrGOZ4L083IEwOHqlHxJmW+ju87X4p87u88uamnpBlMmPzHJ0qLDhRSv/UCcArO
 C19Gw23tbXDIO/DmxAYjuWiV7LkA65wZDN7y8v+SviJG/Vmu+ehwt5sVv6bxbixSTT3f
 DIRkL+ZmCh/i+pplfd050oCfjtk2/8/yI5jwAz8FH0I4zsMUZhOHn43+brToQmBJNzAd
 NNvbicTBTGiQ5hcn+l/9vjjl39MYzM9kpMFomKK6N6L3ZsL69YWZ8LMQLhZU9BoFBUoV
 fSvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs91fKh17rbBk16GO/QJBV7RUgagFHVQzld7dvoxAYCtHfJ4WHKE0Fn7HoBtvsJsfY7YA3Rid6sfA=@nongnu.org
X-Gm-Message-State: AOJu0YyuFuQRUuVrtKFKuhuG+7QtZNQux2jFor3FNFrPFFOsLgSMk2eY
 MVmPYfk2uF1Pu9VtRLjXBQ2awIbgac3ZY3XfsTa5984Z0MfAmz15bEz5bnan/I3q5PEReL/wCk5
 pCfWnWVLkczX0p5Jdt6OSFHfbsr3glicNBkSH7iAUVlJI7pOXijMuCSY4Vd0BZA==
X-Gm-Gg: ASbGncvjSGafs19puBMczXOA5gOj4FFhWqR7m1os0QvYqEChb1F2OCFMays25vBBJnU
 TXhwqZrudA6/JGJyooUftY/Q5UzcAlyg24Don8mW1TLMDBps0pCv4hc6LX85aH3Y+ZorGltUYWk
 25AoHIsMWWA/8lLWZPanDwF6gJPaiOKX7wseHM/35AV44HW8bbhsYiUGFqEJjEiaj/t8Ta5bF7L
 3fUInYxSjYmVOeGEXRHpO9VIC/aH6kh3YHD4JNS++cZ+5PtCagQXfF1goNuyBZI3JbhZMwfPVQ4
 SyQWGg==
X-Received: by 2002:a05:6402:4404:b0:5d9:ad1:dafc with SMTP id
 4fb4d7f45d1cf-5dcdb762de1mr12343590a12.25.1738833306301; 
 Thu, 06 Feb 2025 01:15:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaxmODj+7JvEgHcjt+V7DEdReN0mBSLFFFn0Y3lorGqhRN+/WK+umS3hKF9Xz0E5ZgQLPcSw==
X-Received: by 2002:a05:6402:4404:b0:5d9:ad1:dafc with SMTP id
 4fb4d7f45d1cf-5dcdb762de1mr12343556a12.25.1738833305954; 
 Thu, 06 Feb 2025 01:15:05 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf6c9f85bsm548583a12.61.2025.02.06.01.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 01:15:05 -0800 (PST)
Message-ID: <79d0eeb6-695c-4fc2-82ff-5908476d302b@redhat.com>
Date: Thu, 6 Feb 2025 10:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] rust: bindings for MemoryRegionOps
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250117194003.1173231-1-pbonzini@redhat.com>
 <20250117194003.1173231-11-pbonzini@redhat.com> <Z5d4PTtIRhgZ0tss@intel.com>
 <CABgObfYc5ccC16=K7KVmdLP-jmvwVbxqv1L6c4Oe55MSK4ndng@mail.gmail.com>
 <Z6R9tSD5T5tkCYsP@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z6R9tSD5T5tkCYsP@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ttAwWlLNCwmhfVLRRSl8QYq-5Uen_kUc_rhiqUWrTUs_1738833307
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Thu, 06 Feb 2025 09:15:13 -0000

On 2/6/25 10:15, Zhao Liu wrote:
> Throughout the entire holiday, I couldn't think of a better way to
> express this. I find it particularly useful when wrapping multiple
> callbacks. In the future, I want to explore more use cases where this
> pattern can be applied.

Thanks very much.  Despite having written most of the bindings code, I 
don't want to give the impression that everything that I send to the 
mailing list is gold.  So it matters to me that you send serious 
reviews, and that you can learn something but also suggest 
clarifications and improvements.

> I find even if I drop the `inline` attribution, the test.rs can still be
> compiled (by `make check`), I think it's because test.rs hasn't involved
> memory related tests so that do_init_io isn't linked into test.rs.

Hmm, maybe it's only with some linkers.  I don't remember.

>> This is ugly because do_init_io exists *exactly* to extract the part
>> that is not generic. (See
>> https://users.rust-lang.org/t/soft-question-significantly-improve-rust-compile-time-via-minimizing-generics/103632/8
>> for an example of this; I think there's even a procedural macro crate
>> that does that for you, but I can't find it right now).
> 
> Thanks! I see. I agree to keep `inline` anyway.

In the meanwhile I found it, it's 
https://github.com/llogiq/momo/blob/master/wasm/src/lib.rs.  QEMU could 
add something like that macro to qemu_api_macros, so that

#[qemu_api_macros::upcast]
fn foo<T>(t: &T) where T: IsA<U> {
}

could be converted to

#[inline(always)]
fn foo<T>(&self) where T: IsA<U> {
     fn inner_foo(u: &U) {
     }
     inner_foo(self.upcast())
}

Paolo


