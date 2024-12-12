Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tLhAG-0000PO-Ap
	for mharc-qemu-rust@gnu.org; Thu, 12 Dec 2024 06:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLhAE-0000Od-1f
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 06:15:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tLhAA-0005Ae-QU
 for qemu-rust@nongnu.org; Thu, 12 Dec 2024 06:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734002122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9mTt6IERyXjuxa8VakgUtxDJBiPM+TiXIG4XZH2QDB8=;
 b=F71xPUMAl4m5lfGIrBycziScIP6QssW8ANiY+H/Q445FteooraaMmPXqVxXWnwfeRVq9B8
 LYUV+F/qw4H9cjbyBOkMri/DNjncw712YvDnvC5yf/v9xachNF51apvXWXyPl0prhHZc9z
 YLK8m7bhPPOSPCmyP9yHuRWLykISpoE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-wJlRS759PDG-u5JuHaRl4A-1; Thu, 12 Dec 2024 06:15:20 -0500
X-MC-Unique: wJlRS759PDG-u5JuHaRl4A-1
X-Mimecast-MFC-AGG-ID: wJlRS759PDG-u5JuHaRl4A
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385ded5e92aso206513f8f.3
 for <qemu-rust@nongnu.org>; Thu, 12 Dec 2024 03:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734002119; x=1734606919;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9mTt6IERyXjuxa8VakgUtxDJBiPM+TiXIG4XZH2QDB8=;
 b=cKTqdxXJl+LCHNAbZNlaCdZPE78yLbrNwe1p+ixoIjeQlhFwTJxW3cMUaicpWcG97P
 T+gioSmQqPSCxixZRWyB6Dop+nEuxnmvyKTHxCUA1lHRJJa006xG1m5K7GTYxR1dg6P+
 PMuP08CMk3V7PbnF9LlUZuI8G1UxnY84AspKCgufWGVii/qa9se7mhgDRQ0SCNW8NZ1Y
 s4nJ7H3xW93wKgBJGpTeHmIuBwJJym7jKpgxTgP4h0D4czBypohWYTiE0UxMO6VxfR38
 C6QPNo9CToB7amV8RHI60XRfF+T4JZfYnVZszf20DVVDKAa1pYQhWg0vOYJF4LSZkG1A
 h2rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXee16XzA6P/yB5uzDfJ9I0q4Sug4Xy9OAuvim1or94mrA57Md9kXjtFQd0FVrB7y2pvy1plrfkdaQ=@nongnu.org
X-Gm-Message-State: AOJu0YwQNkpUJfgygLCcwHdFfMuUNhnkFabqCRWc9MwnA6a7p6X9BHeK
 Q73l1eUOcPYspmz8k/LzRACGQ39zT4M4tv+hxQebwQ7A3czyzKnSIh6vTB3zp1HeQkr+Cq2lMvF
 DNyR0JW5m6HmR6AwkP1MxUG6gy8yj0QmbtV3UIiE2sWPDHNzAGLQ=
X-Gm-Gg: ASbGncspQdsqPlydmG/awmA65iSSOpBxzA8+DPxsUguFZdJNcwe1isAln2ZQDxLnFgo
 gZLoRtDwFiHk4i4XxBfPWEc4oyonge6XqSJ+dxqSqS7BaEXjCgiz2JMfP9WlJtGID1gQeZBmi74
 M+LC92f/a7X5mttyx6NDDJAH3fjCy/VaSJBa8VX0FdnxsHI17NbeoPTywNkU2a0ubvrnxTvaDF0
 2o3t50kaBsKu4GJ467buUBMhgZXiF6uXuV4I/C1jAm/Vn0Eb6svCTv3/z2T
X-Received: by 2002:a5d:6487:0:b0:385:f5c4:b30d with SMTP id
 ffacd0b85a97d-3864ce9382fmr5918056f8f.39.1734002118783; 
 Thu, 12 Dec 2024 03:15:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8djUlrM2k6LUKBxzNu8If4oeMRfW1v6NHdzIV8I7gCCNsfHCgwh1ujzHkzDebmYSiHrV/7w==
X-Received: by 2002:a5d:6487:0:b0:385:f5c4:b30d with SMTP id
 ffacd0b85a97d-3864ce9382fmr5918035f8f.39.1734002118474; 
 Thu, 12 Dec 2024 03:15:18 -0800 (PST)
Received: from [192.168.10.27] ([151.81.118.45])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3878251c5a0sm3689723f8f.92.2024.12.12.03.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 03:15:17 -0800 (PST)
Message-ID: <58766430-cfe3-41dc-9275-8fa0ad605076@redhat.com>
Date: Thu, 12 Dec 2024 12:15:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/26] rust: qom: add possibility of overriding unparent
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Junjie Mao <junjie.mao@hotmail.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
 <20241209123717.99077-19-pbonzini@redhat.com> <Z1qvdU+oukSRe8I4@intel.com>
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
In-Reply-To: <Z1qvdU+oukSRe8I4@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r-thK6BB-ZEDnPbF6z1gQfrb7AOMC1jEWHbbmAxH2u8_1734002119
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
X-List-Received-Date: Thu, 12 Dec 2024 11:15:26 -0000

On 12/12/24 10:40, Zhao Liu wrote:
> On Mon, Dec 09, 2024 at 01:37:09PM +0100, Paolo Bonzini wrote:
>> Date: Mon,  9 Dec 2024 13:37:09 +0100
>> From: Paolo Bonzini <pbonzini@redhat.com>
>> Subject: [PATCH 18/26] rust: qom: add possibility of overriding unparent
>> X-Mailer: git-send-email 2.47.1
>>
>> Add a blanket definition of ClassInitImpl<ObjectClass> that thunks
>> ObjectImpl::UNPARENT and overrides it in ObjectClass if it is not
>> None.
>>
>> ClassInitImpl<DeviceClass> can now call its superclass's ClassInitImpl,
>> so that the C and Rust hierarchies match more closely.
>>
>> This is mostly done as an example of implementing the metaclass
>> hierarchy under ClassInitImpl.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   rust/qemu-api/src/definitions.rs  | 44 ++++++++++++++++++++++++++++---
>>   rust/qemu-api/src/device_class.rs |  6 +++--
>>   2 files changed, 45 insertions(+), 5 deletions(-)
> 
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> 
> (with an additional comment below...)
> 
>> diff --git a/rust/qemu-api/src/definitions.rs b/rust/qemu-api/src/definitions.rs
>> index 2429b9f53f0..958ea34decc 100644
>> --- a/rust/qemu-api/src/definitions.rs
>> +++ b/rust/qemu-api/src/definitions.rs
>> @@ -6,7 +6,7 @@
>>   
>>   use std::{ffi::CStr, os::raw::c_void};
>>   
>> -use crate::bindings::{Object, ObjectClass, TypeInfo};
>> +use crate::bindings::{self, Object, ObjectClass, TypeInfo};
>>   
>>   unsafe extern "C" fn rust_instance_init<T: ObjectImpl>(obj: *mut Object) {
>>       // SAFETY: obj is an instance of T, since rust_instance_init<T>
>> @@ -115,6 +115,9 @@ pub trait ObjectImpl: ObjectType + ClassInitImpl<Self::Class> {
>>           class_data: core::ptr::null_mut(),
>>           interfaces: core::ptr::null_mut(),
>>       };
>> +
>> +    // methods on ObjectClass
>> +    const UNPARENT: Option<fn(&mut Self)> = None;
>>   }
> 
> Will we change `&mut Self` to an immutable reference in the future?

Good point, let's do it now since anyway UNPARENT is unused.

Paolo


