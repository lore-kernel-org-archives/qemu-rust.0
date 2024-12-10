Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKwZt-0004Bi-J9
	for mharc-qemu-rust@gnu.org; Tue, 10 Dec 2024 04:30:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKwZr-0004At-Gp
 for qemu-rust@nongnu.org; Tue, 10 Dec 2024 04:30:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKwZo-00082N-Ms
 for qemu-rust@nongnu.org; Tue, 10 Dec 2024 04:30:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733823041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bxvpAyoQv4maySOZlR3wvgmBty9+4wb1C2ofzAnPcYQ=;
 b=U36A/Q3zjcHi0DzH5lcW82BCk94WXy0/fFUUwiZAnc0oQ3WD92BDdoIBBvSpWEJveCoT1T
 CbIILX1jzEmobsc1UAnxok79/JOpCG7kIKdZI2WbCS5VxAVfkZ8E1eG1xYvA8RhQJOAbEQ
 JBbxwrSOtcvRHR2z2sKdd2qLV2Et/lM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-tBrz32yhO0-sM0QNijRzkw-1; Tue, 10 Dec 2024 04:30:37 -0500
X-MC-Unique: tBrz32yhO0-sM0QNijRzkw-1
X-Mimecast-MFC-AGG-ID: tBrz32yhO0-sM0QNijRzkw
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-434fe2b605eso8924705e9.2
 for <qemu-rust@nongnu.org>; Tue, 10 Dec 2024 01:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733823036; x=1734427836;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bxvpAyoQv4maySOZlR3wvgmBty9+4wb1C2ofzAnPcYQ=;
 b=g8/bicdW1l9yIy1lP5aVyYha90io0BgfrgbrBx+8C6akTZ1Quxr/2jln3RoEmUQo2Q
 4jaDKO8Qw7SCUrSuDcGML7cYLpGQJQN/cUyPHgKrc+1zM2+SzKJW4QmJozWBhTZU8x7y
 VXmywpyVKy63TiUM1MtMjvKp3YzB/V7fBvYE1v6LXLTzrhnhIi+Kk7Z3rfG52M8tr8q3
 S02I3soFcwBenFatjpq/8P2vDLXZpVv/4Ufj3pOs9SxKhxCeIxR47kWLDWOzMwvj+9S5
 gklcNgWfYlQyeGSA6Xme+JR5mfVkxsmeL4lf0dpjrH3B8RyHJi+N/BmginvlZIRRtPMJ
 DOMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVfVUcTzLgGOoUNdR/aDFUWEJ63+NWPeDeZMOkGBgmfC+cZsbNyBv4EcCY46Ci8P69q4yhsRmmqbE=@nongnu.org
X-Gm-Message-State: AOJu0YyxFTILggS54R/eG1wo2WQL26eJUKPlbvOgFCiqxlgAO6EcM4tF
 dZIIOyH3+MgJqKfZvAN6+l+fLp0Mm9oxTR4fXJQTJiojqO8MhmK8hwv0+Fcb64If5zxYvDtzkcF
 UgnmQkHsWcI5Hq9jllKIHT9rOjgk2NC5AOPCH56TfPP2eUJ8YWPs=
X-Gm-Gg: ASbGnct4mCM4HBu8ilLThTlz7RE1Aiwcg1xZ4skjBO2HpGbKl1qNOQjon0dvASvJFJF
 RJXwLe9YHsdYjOiJ/6b7w6t986Ad3oTZpJYe0ieCF2Vh9dVxqpyr/kWHIcwq76kKPhbsVnBkISR
 YOXg6KF5TALhL92bQRKG0gZeI8vTtmQHiFlt97EyPLDMKEFd/u6vHecmdgfHq2HJ+Ezqvn+jvI0
 5a38yiY/1/hit5hWq++dlWtobm5K6tcxI1tQDrUcM85ie5RR88fhdzukQ==
X-Received: by 2002:a05:600c:1da7:b0:434:f871:1b97 with SMTP id
 5b1f17b1804b1-434fffca42dmr26993875e9.33.1733823035271; 
 Tue, 10 Dec 2024 01:30:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgJfNOP9n6oIx1oYznaiE6hYRWdFdgJdGHx54kswBcXbqdBZ6SAXqFViK7gmCESCzJ8PmQDw==
X-Received: by 2002:a05:600c:1da7:b0:434:f871:1b97 with SMTP id
 5b1f17b1804b1-434fffca42dmr26993665e9.33.1733823034924; 
 Tue, 10 Dec 2024 01:30:34 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3861fc514fcsm15581973f8f.48.2024.12.10.01.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 01:30:34 -0800 (PST)
Message-ID: <4ced3c93-32de-4c81-b19c-947c27c4ec50@redhat.com>
Date: Tue, 10 Dec 2024 10:30:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/26] rust: add a bit operation module
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Junjie Mao <junjie.mao@hotmail.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
 <20241209123717.99077-7-pbonzini@redhat.com> <Z1f4IN3mfYB/jq8G@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 xsEhBFRCcBIBDqDGsz4K0zZun3jh+U6Z9wNGLKQ0kSFyjN38gMqU1SfP+TUNQepFHb/Gc0E2
 CxXPkIBTvYY+ZPkoTh5xF9oS1jqI8iRLzouzF8yXs3QjQIZ2SfuCxSVwlV65jotcjD2FTN04
 hVopm9llFijNZpVIOGUTqzM4U55sdsCcZUluWM6x4HSOdw5F5Utxfp1wOjD/v92Lrax0hjiX
 DResHSt48q+8FrZzY+AUbkUS+Jm34qjswdrgsC5uxeVcLkBgWLmov2kMaMROT0YmFY6A3m1S
 P/kXmHDXxhe23gKb3dgwxUTpENDBGcfEzrzilWueOeUWiOcWuFOed/C3SyijBx3Av/lbCsHU
 Vx6pMycNTdzU1BuAroB+Y3mNEuW56Yd44jlInzG2UOwt9XjjdKkJZ1g0P9dwptwLEgTEd3Fo
 UdhAQyRXGYO8oROiuh+RZ1lXp6AQ4ZjoyH8WLfTLf5g1EKCTc4C1sy1vQSdzIRu3rBIjAvnC
 tGZADei1IExLqB3uzXKzZ1BZ+Z8hnt2og9hb7H0y8diYfEk2w3R7wEr+Ehk5NQsT2MPI2QBd
 wEv1/Aj1DgUHZAHzG1QN9S8wNWQ6K9DqHZTBnI1hUlkp22zCSHK/6FwUCuYp1zcAEQEAAc0j
 UGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT7CwU0EEwECACMFAlRCcBICGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRB+FRAMzTZpsbceDp9IIN6BIA0Ol7MoB15E
 11kRz/ewzryFY54tQlMnd4xxfH8MTQ/mm9I482YoSwPMdcWFAKnUX6Yo30tbLiNB8hzaHeRj
 jx12K+ptqYbg+cevgOtbLAlL9kNgLLcsGqC2829jBCUTVeMSZDrzS97ole/YEez2qFpPnTV0
 VrRWClWVfYh+JfzpXmgyhbkuwUxNFk421s4Ajp3d8nPPFUGgBG5HOxzkAm7xb1cjAuJ+oi/K
 CHfkuN+fLZl/u3E/fw7vvOESApLU5o0icVXeakfSz0LsygEnekDbxPnE5af/9FEkXJD5EoYG
 SEahaEtgNrR4qsyxyAGYgZlS70vkSSYJ+iT2rrwEiDlo31MzRo6Ba2FfHBSJ7lcYdPT7bbk9
 AO3hlNMhNdUhoQv7M5HsnqZ6unvSHOKmReNaS9egAGdRN0/GPDWr9wroyJ65ZNQsHl9nXBqE
 AukZNr5oJO5vxrYiAuuTSd6UI/xFkjtkzltG3mw5ao2bBpk/V/YuePrJsnPFHG7NhizrxttB
 nTuOSCMo45pfHQ+XYd5K1+Cv/NzZFNWscm5htJ0HznY+oOsZvHTyGz3v91pn51dkRYN0otqr
 bQ4tlFFuVjArBZcapSIe6NV8C4cEiSTOwE0EVEJx7gEIAMeHcVzuv2bp9HlWDp6+RkZe+vtl
 KwAHplb/WH59j2wyG8V6i33+6MlSSJMOFnYUCCL77bucx9uImI5nX24PIlqT+zasVEEVGSRF
 m8dgkcJDB7Tps0IkNrUi4yof3B3shR+vMY3i3Ip0e41zKx0CvlAhMOo6otaHmcxr35sWq1Jk
 tLkbn3wG+fPQCVudJJECvVQ//UAthSSEklA50QtD2sBkmQ14ZryEyTHQ+E42K3j2IUmOLriF
 dNr9NvE1QGmGyIcbw2NIVEBOK/GWxkS5+dmxM2iD4Jdaf2nSn3jlHjEXoPwpMs0KZsgdU0pP
 JQzMUMwmB1wM8JxovFlPYrhNT9MAEQEAAcLBMwQYAQIACQUCVEJx7gIbDAAKCRB+FRAMzTZp
 sadRDqCctLmYICZu4GSnie4lKXl+HqlLanpVMOoFNnWs9oRP47MbE2wv8OaYh5pNR9VVgyhD
 OG0AU7oidG36OeUlrFDTfnPYYSF/mPCxHttosyt8O5kabxnIPv2URuAxDByz+iVbL+RjKaGM
 GDph56ZTswlx75nZVtIukqzLAQ5fa8OALSGum0cFi4ptZUOhDNz1onz61klD6z3MODi0sBZN
 Aj6guB2L/+2ZwElZEeRBERRd/uommlYuToAXfNRdUwrwl9gRMiA0WSyTb190zneRRDfpSK5d
 usXnM/O+kr3Dm+Ui+UioPf6wgbn3T0o6I5BhVhs4h4hWmIW7iNhPjX1iybXfmb1gAFfjtHfL
 xRUr64svXpyfJMScIQtBAm0ihWPltXkyITA92ngCmPdHa6M1hMh4RDX+Jf1fiWubzp1voAg0
 JBrdmNZSQDz0iKmSrx8xkoXYfA3bgtFN8WJH2xgFL28XnqY4M6dLhJwV3z08tPSRqYFm4NMP
 dRsn0/7oymhneL8RthIvjDDQ5ktUjMe8LtHr70OZE/TT88qvEdhiIVUogHdo4qBrk41+gGQh
 b906Dudw5YhTJFU3nC6bbF2nrLlB4C/XSiH76ZvqzV0Z/cAMBo5NF/w=
In-Reply-To: <Z1f4IN3mfYB/jq8G@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vf5_rsM6GOm7cvI0N6p5c5F9KgpK-kdl3HdZ1jxDDGg_1733823036
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.489,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 10 Dec 2024 09:30:48 -0000

On 12/10/24 09:13, Zhao Liu wrote:
>> diff --git a/rust/qemu-api/src/bitops.rs b/rust/qemu-api/src/bitops.rs
>> new file mode 100644
>> index 00000000000..5acd6642d1a
>> --- /dev/null
>> +++ b/rust/qemu-api/src/bitops.rs
>> @@ -0,0 +1,119 @@
>> +// Copyright (C) 2024 Intel Corporation.
>> +// Author(s): Zhao Liu <zhai1.liu@intel.com>
> 
> You deserve to be the author!

I'll add both of us.  At this stage even identifying a need is an 
important step.

>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +//! This module provides bit operation extensions to integer types.
>> +//! It is usually included via the `qemu_api` prelude.
>> +
>> +use std::ops::{
>> +    Add, AddAssign, BitAnd, BitAndAssign, BitOr, BitOrAssign, BitXor, BitXorAssign, Div, DivAssign,
>> +    Mul, MulAssign, Not, Rem, RemAssign, Shl, ShlAssign, Shr, ShrAssign,
>> +};
>> +
>> +/// Trait for extensions to integer types
>> +pub trait IntegerExt:
>> +    Add<Self, Output = Self> + AddAssign<Self> +
>> +    BitAnd<Self, Output = Self> + BitAndAssign<Self> +
>> +    BitOr<Self, Output = Self> + BitOrAssign<Self> +
>> +    BitXor<Self, Output = Self> + BitXorAssign<Self> +
>> +    Copy +
>> +    Div<Self, Output = Self> + DivAssign<Self> +
>> +    Eq +
>> +    Mul<Self, Output = Self> + MulAssign<Self> +
>> +    Not<Output = Self> + Ord + PartialOrd +
>> +    Rem<Self, Output = Self> + RemAssign<Self> +
>> +    Shl<Self, Output = Self> + ShlAssign<Self> +
>> +    Shl<u32, Output = Self> + ShlAssign<u32> + // add more as needed
> 
> Ah, I used to define shift bits as usize. I can change the bit shift
> type back to u32 in HPET.

I used u32 because BITS is u32 in the standard library, so probably 
better to change it in HPET.

>> +    Shr<Self, Output = Self> + ShrAssign<Self> +
>> +    Shr<u32, Output = Self> + ShrAssign<u32> // add more as needed
>> +{
>> +    const BITS: u32;
>> +    const MAX: Self;
>> +    const MIN: Self;
>> +    const ONE: Self;
>> +    const ZERO: Self;
>> +
>> +    #[inline]
>> +    #[must_use]
>> +    fn bit(start: u32) -> Self
>> +    {
>> +        assert!(start <= Self::BITS);
>> +
>> +        Self::ONE << start
>> +    }
> 
> I think with this helper, I can add activating_bit() and deactivating_bit()
> bindings, as they are also commonly used operations.
> 
> I will rename them to activate_bit and deactivate_bit, if no one has any
> objections.

I think "-ing" is correct because it looks at a change between two 
values.  Or another possibility is putting the mask as "self":

     fn bits_activated(from: Self, to: Self) -> bool {
         (to & !from & self) != 0
     }

     fn bits_deactivated(from: Self, to: Self) -> bool {
         (from & !to & self) != 0
     }

Anyhow feel free to pick something you like and add it to IntegerExt.

>> +    #[inline]
>> +    #[must_use]
>> +    fn deposit<U: IntegerExt>(self, start: u32, length: u32,
>> +                          fieldval: U) -> Self
>> +        where Self: From<U>
>> +    {
>> +        debug_assert!(length <= U::BITS);
> 
> assert? as you've already replaced debug_assert with assert in BqlCell.

No, not this time :) Rust has checks for overflow in debug mode but not 
in release mode, so (independent of how Meson handles debug assertions) 
debug_assert is the right one here.

Paolo

>> +        let mask = Self::mask(start, length);
>> +        (self & !mask) | ((Self::from(fieldval) << start) & mask)
>> +    }
>> +
> 
> Very useful for HPET! Thanks.
> 
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> 
> 
> 


