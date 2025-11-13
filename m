Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D428BCD6E6C
	for <qemu-rust@archiver.kernel.org>; Thu, 13 Nov 2025 14:37:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vJYRV-0008Rd-QT; Thu, 13 Nov 2025 09:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vJYKu-0002P0-OM
 for qemu-rust@nongnu.org; Thu, 13 Nov 2025 09:30:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vJYKr-0001A9-Sh
 for qemu-rust@nongnu.org; Thu, 13 Nov 2025 09:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763044203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1qr20ZyZERt2gMXdQ/W6asiXmbcaJ9I0n9I3WfoiU8Q=;
 b=I/g3TbZrV4sfbUUke2m68QtrtpVWACXDV3Zrtb+9aYKlCwSYzY89FC7WldmGzZcM5EXBRP
 VYeY/Kd9lJKjB+RVm45Es7G7k7RgtJ9uWZ7Bz9fc8UmhLQV3gd8dnUNAAcv4xLeFU9ycQ/
 k7w8W2dbnCNQCgk+NPCEooEph5Qc0J0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-Q7vpJgqCOBeA3M4lebRjWg-1; Thu, 13 Nov 2025 09:30:02 -0500
X-MC-Unique: Q7vpJgqCOBeA3M4lebRjWg-1
X-Mimecast-MFC-AGG-ID: Q7vpJgqCOBeA3M4lebRjWg_1763044201
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b73586b1195so48566766b.3
 for <qemu-rust@nongnu.org>; Thu, 13 Nov 2025 06:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763044201; x=1763649001;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1qr20ZyZERt2gMXdQ/W6asiXmbcaJ9I0n9I3WfoiU8Q=;
 b=LIBgc995Abdh4UIKtpwmm3NV2rL0OFuwTiLLa2I64WrDHExsbBGVePJeFCTRc9onBV
 PBgDmkCwStRFy3IVx/h3ys3RVU3lxfylAz6xVxbOvpAdMKAFAvLVq2VmO1sqBixQ8+gY
 bMhmwdcYajvhNZocBxyRoYZ+KWCkt0fB2UYY1REQ8uhOxzkV1jOKCkcDYqhTlUu1CuNB
 5cfWUIeuJdogQDrGYSunQwa/4mbRw0yeMrL47m2dAQMNJOzvfx2HnThOKeAOrstNjXRB
 Ko6ir6A7oZOLcEZGrYXmrdV+tbMjTXisENQ3bikzPzvbN454HapMUsi21KhjjS5cDymP
 fhzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoDClDWKpHk+ivN8yBD0TOTUlVkm/Ydim+puSl5+oWcHYBjB+YpKzmXt5ub14NNPMgsQJ5YyyirY4=@nongnu.org
X-Gm-Message-State: AOJu0YwMre9dRrtz70IBGfV8FVNhRQKORBJ38tN12IPTzI9vL8U7GjZY
 BoEcR64oGjjPkzZRsYuzbBxFCL9l1nDFF6aGsgyaLlNsY5j41iD1ZE7OK+cII1XQGWkuyBaIyXN
 VitfmaBv6nlWvgwIUnQdtEdVUH6idZvNaQOfXqMcaWmkLkmHsoLSs0wE=
X-Gm-Gg: ASbGnctVd7v0ZVM5V1HpYWJMcqbnNdxBUv68ugj4goHg2hFSaz9i91oFdsckxHeZT4a
 O/TU0I0mrUjINKyHIpO8wVY7U6DjHBVnbmEWhEeIetk31Wu3/eE2yia8Rcyc+nx/w/NM9c9WeEW
 gJzcDJw4LhMGx2x+8hm8CBcgVA7AuCd710Pruf7wP7mPDL7p6SnMWRbDNSV9oBvCQBJ4z48eV1D
 1NtsZhrIwvvcrUT2BXLYYOwqdAdRDhzEYZ6c2VUwHmgctmyINF/Qi3LZUOMjChlR09+zLjPHyrv
 Oqs6S0gRtbaC4PQwZLyjYiaV2/ufc6u+xMVIvJmob6FtTNd9H6UvPpulhp4e3lvjxrVtSQiw8IH
 ZYy8kIbdzan0cQOn13FFEj18ZX3Z8oM6XLPmhgD7476xJlC+khehO3RJUyMRmw6Yy+Dy4O5nxUV
 gqEgb7
X-Received: by 2002:a17:907:9493:b0:b73:1b11:2ac2 with SMTP id
 a640c23a62f3a-b7331b3bd59mr789858966b.63.1763044200791; 
 Thu, 13 Nov 2025 06:30:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPtf/Dl9N11d3a4qffn/l4s3DdirNqKWzR/S+5rVaL2MZ/+PDbFQAXehJbnDBmu7OcsacRXQ==
X-Received: by 2002:a17:907:9493:b0:b73:1b11:2ac2 with SMTP id
 a640c23a62f3a-b7331b3bd59mr789856966b.63.1763044200389; 
 Thu, 13 Nov 2025 06:30:00 -0800 (PST)
Received: from [192.168.10.81] ([176.206.119.13])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b734fd809fasm175926166b.45.2025.11.13.06.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 06:29:59 -0800 (PST)
Message-ID: <6ed6a959-fe49-4635-9051-b9bbc91dd2e4@redhat.com>
Date: Thu, 13 Nov 2025 15:29:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/22] rust/hpet: Enable lockless IO
To: Zhao Liu <zhao1.liu@intel.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
References: <20251113051937.4017675-1-zhao1.liu@intel.com>
 <20251113051937.4017675-23-zhao1.liu@intel.com>
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
In-Reply-To: <20251113051937.4017675-23-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Av1nRtm0evWwJOLysVpUQb2xQtgDfkqGDZnSQIT1Ryk_1763044201
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On 11/13/25 06:19, Zhao Liu wrote:
> Enable lockless IO for HPET to allow BQL free MMIO access.
> 
> But BQL context is still needed for some cases during MMIO:
>   * IRQ handling:
> 
>     Like C version of HPET did (commit d99041a20328 ("hpet: guard IRQ
>     handling with BQL"), BQL context is needed during IRQ handling.
> 
>     But Rust HPET has an extra reason that InterruptSource is placed in
>     BqlCell, which requires BQL context explicitly. (This also shows
>     that the BQL limitation in the design of the InterruptSource binding
>     is reasonable.)

Thanks, this is helpful.  It shows some complications that I honestly 
hadn't thought about.  So many more things to be precise about, compared 
to C...  but I have an idea which I'll mention below. :)

>   * BqlCell/BqlRefCell access.
> 
>     Except InterruptSource, HPETState has other BqlCell and BqlRefCell:
>     hpet_offset (BqlCell<u64>), rtc_irq_level (BqlCell<u32>) and timers
>     ([BqlRefCell<HPETTimer>; HPET_MAX_TIMERS]).
> 
>     Their data may change during runtime, so the atomic context is
>     required.

I have already mentioned HPETTimer in the other email, but I would also 
move hpet_offset to HPETRegisters if possible.  It doesn't seem hard.

And as an aside, I wonder if you really need to pass MutexGuard and not 
&mut HPETRegisters.  Once you don't have BQL dependencies, you can just 
remove the assert!(bql::is_locked()) without switching to MutexGuard<>.

In the meanwhile, even if they are not perfect (especially due to 
migration), I think touching patches 1-19 further is too messy, so I'll 
rebase on top of Stefan's tracing patches and push them to rust-next. 
Let's start from there and I'll take a look tomorrow maybe on how to fix 
migration.  Migratable<HPETTimer> looks like a powerful tool for that.

Then the new problem is that we have to figure out a way to handle IRQs. 
They are also messy for PL011 compared to the C version, and that will 
make it possible to enable lockless IO.

The crazy idea that just came to mind, is a Latched<u32> that is 
something like an (AtomicU32, BqlCell<u32>) tuple.  Then we set the 
individual bits outside the BQL and update IRQs at the end of the MMIO 
in a bql::with_guard() block.  Maybe if you have some time you can 
prototype that for PL011 (even without generics, you could just do 
LatchedU32 for a start)?

Paolo


