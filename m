Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tERHx-0004K5-7R
	for mharc-qemu-rust@gnu.org; Fri, 22 Nov 2024 05:53:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tERHw-0004Jf-BO
 for qemu-rust@nongnu.org; Fri, 22 Nov 2024 05:53:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tERHt-0004Xv-EZ
 for qemu-rust@nongnu.org; Fri, 22 Nov 2024 05:53:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732272800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XsYYWjOO8HKXhzk1rQp3P+j3SgMzg4Blb9AC4V3hfmY=;
 b=YHk4Y7/YeMbWZAXo6+X0x5ew1i1kR6xcJZgLPVnXy/KSMw7E8381zo+x4dSB+d6Hx22Oz3
 UhSuyw/VwZ2pwCNjjGp7EA2jNKxVX8AMN2gQ7dd/7SiqzpgRvMSICitX/a0S4hVvuZiXWG
 NAbdheHa3jown4bGJ4b/l53+v+xEiF0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-xTSw405EOoSTKPtjqDIrYQ-1; Fri, 22 Nov 2024 05:53:19 -0500
X-MC-Unique: xTSw405EOoSTKPtjqDIrYQ-1
X-Mimecast-MFC-AGG-ID: xTSw405EOoSTKPtjqDIrYQ
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-53dd8a4db1bso188487e87.0
 for <qemu-rust@nongnu.org>; Fri, 22 Nov 2024 02:53:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732272798; x=1732877598;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XsYYWjOO8HKXhzk1rQp3P+j3SgMzg4Blb9AC4V3hfmY=;
 b=F5bgY2iHQbSTGovvF9ZtCSxaKY+Z1iCFkUA/3c0b2EsmZY2BgZR7JAzFwCx3fq1Xb3
 y8IXcWWAwGowWuBviH4xsg/63VxIXDn5ThwyRjS87NxSBvbr3HJ15ZqJ5TAEACzcFf7U
 VRbWRFZSimUJdDRzsbHXajWi2h0vjNB9kZSI0UCdww/93ITdFyQfoNNPQG7f/mdkRl52
 fYoSxlitVdELTxec2HkcT6NOcY0/VjhJ/RuWYYIFM2kxXBfGq/PIqPjPhsnYCFk1Bfqs
 lw1JRnEQevb0uvZkPP9XBs6k5xtgN05fsB05ADnmiMnx0Dvuz+6PdObzCjByZYgh1LTa
 iwdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO8z6mnIHsKgU70sO3+yNEQT0oV8+oba9kNNQgIGDP5brKGrIDp1/vEoYOBvoBap0LAYBL0oM1uFM=@nongnu.org
X-Gm-Message-State: AOJu0YyJtKErmguIq9OP7wc2Lez5RAuDXGLH/yCkrqYi5YkXb3nCsvvu
 gI9Bz7RzF7ZjvaCxECDoJRIFaKSF3/Vxf+y3R6JDNG9bqYx9dwZeV+lORo507dHUzmkwa+zVJG1
 HAYJIvSGeLv/rkrh2VAzGWaYz/Py6YxV6ZBuMkacoDDR4YjtNGqw=
X-Gm-Gg: ASbGncstofvBbvl/nD23WInw7B16OCtyMilltDIVKW5WJaeZzYgqNCgm15cKb4h6gFA
 QWurW1i1Q3XnxiWcKV/ww+AWK7d4Xy//dlzX/aAxpSmX1iooEGSwBkiCtKZnFXtfMevk5M9mZy7
 9phDD1v2qDjGExapySOaGE9wkaHV/EZtgDHQ+GlrSHmuX1hTwPLlrivD4B6zrU5nrsDq7BvZMYV
 YXspgl3eiJxzB4pH7qFpFltjNgGQm0cJcn0fJNMsnd9934YsTfJi1w=
X-Received: by 2002:a05:6512:23aa:b0:53d:a077:1d0b with SMTP id
 2adb3069b0e04-53dd39b1de0mr1065851e87.44.1732272797585; 
 Fri, 22 Nov 2024 02:53:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNzKarDke+eQSQc8WiBW8HKEGadVwGpDZwqj2qkz9u36+vxiefHD0aflT1yDhCsdtP0gD1BQ==
X-Received: by 2002:a05:6512:23aa:b0:53d:a077:1d0b with SMTP id
 2adb3069b0e04-53dd39b1de0mr1065842e87.44.1732272797164; 
 Fri, 22 Nov 2024 02:53:17 -0800 (PST)
Received: from [192.168.10.28] ([151.49.204.250])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3825fad6723sm2078737f8f.16.2024.11.22.02.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Nov 2024 02:53:16 -0800 (PST)
Message-ID: <90f9f6b1-f590-43cb-b71d-dc73992bd82a@redhat.com>
Date: Fri, 22 Nov 2024 11:53:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: add bindings for interrupt sources
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, junjie.mao@hotmail.com, zhao1.liu@intel.com,
 qemu-rust@nongnu.org
References: <20241122074756.282142-1-pbonzini@redhat.com>
 <20241122074756.282142-3-pbonzini@redhat.com>
 <70f44731-6879-4adf-a71b-a781af48fe99@linaro.org>
 <CABgObfbOj8FCvjXOM_AF8=jyFMi1bs-gfsRu+_GH3802hLhM1A@mail.gmail.com>
 <fff34325-203e-4138-a795-27a45b20e6ab@linaro.org>
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
In-Reply-To: <fff34325-203e-4138-a795-27a45b20e6ab@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PlcrY0QHU_2MMWWNAEnc7y-8hxPVJYvXv6jf8MUEBzU_1732272798
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.14,
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
X-List-Received-Date: Fri, 22 Nov 2024 10:53:24 -0000

On 11/22/24 11:30, Philippe Mathieu-Daudé wrote:
> On 22/11/24 09:32, Paolo Bonzini wrote:
>>>> +/// Interrupt sources are used by devices to pass changes to a 
>>>> boolean value to
>>>> +/// other devices (typically interrupt or GPIO controllers).  QEMU 
>>>> interrupt
>>>> +/// sources are always active-high.
>>>
>>> So 'always active-high' = true below? (Wondering about pulsation, if the
>>> true -> false transition is always correct).
>>
>> Yeah, I mean that raise uses true (or 1 :)) and lower uses false.
>> an example?
> 
> I was thinking of an active-low line where you want to pulse 1 -> 0.
> Just chiming in, not to worry about.

This is not happening at the device level, so I assume that such a line 
would not use raise/lower.  Rather, the board (which is on the interrupt 
sink side) would install a qemu_irq_invert() between the device and the 
interrupt controller or GPIO controller.

>>> Is this deliberate to restrict the Rust binding to boolean? (Maybe you
>>> envision a VectoredInterruptSource implementation for that).
>>
>> No, I simply wasn't aware of that.  I'll adjust; do you have
>> an example?
> 
> I am having hard time to find one, in particular because I
> removed one in c264c074d8 ("hw/intc: Remove TYPE_ETRAX_FS_PIC device"):

Ok, then we could put the type as a generic parameter, and use that 
parameter in InterruptSource::set().

pub struct InterruptSource<T = bool> where u32: From<T> {
     inner: BqlCell<*mut IrqState>,

     // this is only needed top ensure that T appears somehow in the
     // struct.  Random Rust type theory stuff. :)
     _marker: PhantomData<fn(&Self, T)>,
}

...

/// Send `level` to the interrupt sink.
pub fn set(&self, level: T) {
     let ptr = self.0.get();
     // SAFETY: the pointer is retrieved under the BQL and remains valid
     // until the BQL is released, which is after qemu_set_irq() is entered.
     unsafe {
         qemu_set_irq(ptr, level.into());
     }
}

and then only implement raise/lower/pulse for InterruptSource<bool>.

This is backwards compatible so we can do it either now, or later when 
needs arises.  You tell me. :)

Paolo

> See Peter's comment in https://lore.kernel.org/qemu-devel/ 
> CAFEAcA9cObnb11cSS_StbSHdP0aB6sDeqSHfjb3-qRBfy7K9Kw@mail.gmail.com/
> 
>>>> +/// Interrupt sources can only be triggered under the Big QEMU 
>>>> Lock; they are
>>>> +/// neither `Send` nor `Sync`.
>>
>> Oops, this is incorrect.  BqlCell *is* Send/Sync, but checks the
>> BQL state at run-time.
>>
>> Paolo
>>
> 
> 
> 


