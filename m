Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE153D185DC
	for <qemu-rust@archiver.kernel.org>; Fri,  9 Jan 2026 12:11:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1veBL6-0001am-WB; Fri, 09 Jan 2026 07:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1veBL5-0001UG-2t
 for qemu-rust@nongnu.org; Fri, 09 Jan 2026 07:11:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1veBL3-0001iy-F4
 for qemu-rust@nongnu.org; Fri, 09 Jan 2026 07:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767960692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=D3uJsoyXz7vh50vIZtr0UHIwczu3RKQIX6l67/FjIxQ=;
 b=ibXV5J3lK5OA9NONQUdFt4q1HMjPx8/Pz6AkpHC4vRJoqc0P2DgDp3GPgCZByC4p/rhm0X
 Ckva2kU8YQr014nfShgNbaWZXPr0H6p5k/Ne/M/4tQO8gaj1XPTGzKNa2+FRaxkYlwvIQF
 cnIBbVegoq45X3Au8QxBMSeckqQxx0k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-hpd3rXOOPpqEfO5f6XQnHQ-1; Fri, 09 Jan 2026 07:11:31 -0500
X-MC-Unique: hpd3rXOOPpqEfO5f6XQnHQ-1
X-Mimecast-MFC-AGG-ID: hpd3rXOOPpqEfO5f6XQnHQ_1767960690
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-477a1e2b372so38354525e9.2
 for <qemu-rust@nongnu.org>; Fri, 09 Jan 2026 04:11:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767960690; x=1768565490;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D3uJsoyXz7vh50vIZtr0UHIwczu3RKQIX6l67/FjIxQ=;
 b=GgDxE2FK7TOwZ8K+H/IUGscBhEalQboG3rkM0sx1xJPSm+FT9OSLssQGo8niBDvwcl
 TJ36Poyf08sCXLQpePAJ5iaLOYwgKtK6RUxem7QVOC8FUY9ChkyeaMe/1dvqHtJFC8P6
 adtaIefR/C4PdYBampuFCqhTvOSdFRoYWVSXMV+ZhCiYcyzJS/rJeeOux8C8HJCSw2YD
 MDvbFpmV7FHOkl6ttappcpOr+VNGiywAwEn02NbD9DX1eO/gjisBj+szriqXgsG5dZ6N
 rpX+GtfV6HSo14vt8rfNnrQUEBmifjhvJBuFkaJIpsmw+37SDuPBFM+BD/6vz9cKTDns
 Kv0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4vWb+mPgyMGb+Skh0ngJPeSJXYmqZBD8l6sVfGx0W0pZId3StEyoMfNU9jrJj0KJr9rf0Vx3s++Q=@nongnu.org
X-Gm-Message-State: AOJu0YxILNTo/W2qnjGdyRSnboeddsqzXs2pLmvYnsk6TzAcbdU9MBTs
 leiTTyLhIW+86PFr1n1RFQsoWz1M/98Jlk317BxfTUzfHnYbdyeijZ2xnCpeovgc4jKOlftUZ9X
 w+eKctoAFvmQOcIsg9iarJmbCedv8xzcxQpLU6hwkcu2sPVQB9cMSYy0=
X-Gm-Gg: AY/fxX7Smnf6JaQ+nwX3N5jOG5HoACrLxXWYfhWBbYtLm5U65vv5dOTsEd+YEb4Z5rZ
 /N7j7u+jcIUbAUn8p3fXvGNSuH5EURL8e8lxJqQQYG0iS65UnJ+gUh32gjgcd8uomaq2EUynp3G
 +jwHZ7ImgEaE460rSsaF3rlDSWGbMzyXsfi5egRlaTKL/zjIA74NKcg8YSsQQMDkJLdNdKFZq0a
 gdGnuQADEG/STEkvco7kHX3WD5eIkBNu8HXsiooMY7vGCDDD2ezd1ool6CCkowzGWoUkcW8ZARf
 1UzzsCLsMcbDNOsdr1ZOgYoYqn9aMsYp0BzvDkTU8dHGVnoy8XqqK+M+SoyWWQlcQNUlbyCAAS+
 mFGYNEdphD6pfAnKd6AMwc2lPRC/MmZ06jeUxvGb/LLxKy8VBkPr4sfmNpjOAaG+OnKEKQOijjg
 69p8YjrWRgD55TVw==
X-Received: by 2002:a05:600c:444f:b0:477:df3:1453 with SMTP id
 5b1f17b1804b1-47d8a177307mr66116815e9.28.1767960690434; 
 Fri, 09 Jan 2026 04:11:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMClP8jxfN9WVpN2beJFxEBuzdL9zxo7p9nfwBx4eTRRkfIOQApj0+oCYW2LeHHyRWItftXw==
X-Received: by 2002:a05:600c:444f:b0:477:df3:1453 with SMTP id
 5b1f17b1804b1-47d8a177307mr66116615e9.28.1767960690009; 
 Fri, 09 Jan 2026 04:11:30 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-432bd0daa84sm21967932f8f.2.2026.01.09.04.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 04:11:29 -0800 (PST)
Message-ID: <69602270-54d0-4bc7-b69f-27ab16cdb6e1@redhat.com>
Date: Fri, 9 Jan 2026 13:11:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/24] util: add API to fetch the current thread name
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 devel@lists.libvirt.org, qemu-block@nongnu.org, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20260108170338.2693853-1-berrange@redhat.com>
 <20260108170338.2693853-9-berrange@redhat.com>
 <8867bff0-227f-46b9-b0c6-938fc0d6f625@redhat.com>
 <aWDs0OMLdap9q70B@redhat.com>
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
In-Reply-To: <aWDs0OMLdap9q70B@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ckwA8CGXcthUul1eAODAXXraOYQ6jRD75onscHf-6kw_1767960690
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/9/26 12:56, Daniel P. Berrangé wrote:
> On Fri, Jan 09, 2026 at 12:49:20PM +0100, Paolo Bonzini wrote:
>> On 1/8/26 18:03, Daniel P. Berrangé wrote:
>>> +static __thread char namebuf[PTHREAD_MAX_NAMELEN_NP];
>>
>> ... you can instead of the previous patch, add a constructor here that just
>> sets namebuf to "main" with strcpy.
> 
> How about just a static initializer
> 
>    static __thread char namebuf[PTHREAD_MAX_NAMELEN_NP] = { 'm', 'a', 'i', 'n', '\0' };
> 
> or is there some interaction with __thread that makes that undesirable ?

This would break here:

     if (namebuf[0] != '\0') {
         return namebuf;
     }

and every thread would have "main" as the name, because static 
initializers for __thread apply to all threads.

Thanks,

Paolo


