Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tiFub-0003KM-Nj
	for mharc-qemu-rust@gnu.org; Wed, 12 Feb 2025 11:48:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiFua-0003K2-3M
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 11:48:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiFuY-0004Jj-JR
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 11:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739378909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XLcm+GYuwWup40Gm8eKU9GKMwCAH9+g9RxmfHL3bkfA=;
 b=YVasorpTS+v2RY8ZJhlsOW+3zeJX/nSVuxava9O0uoW8TpwM9Xs4/MBkDUu6WHUY+/Nq+e
 TmFLcT2AxZxFkdYsTvEB7uUFVhNg34UJVO9PXr3/V3uTL5KJ8uLbJvLSuyCwE+Fujqme6B
 XzYo8rYpzYtEcrK+P7EhyXZ5Y79tauc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-9507i0hSNjyuQsdF1pJe5Q-1; Wed, 12 Feb 2025 11:48:28 -0500
X-MC-Unique: 9507i0hSNjyuQsdF1pJe5Q-1
X-Mimecast-MFC-AGG-ID: 9507i0hSNjyuQsdF1pJe5Q
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38dd1bdf360so2119060f8f.3
 for <qemu-rust@nongnu.org>; Wed, 12 Feb 2025 08:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739378907; x=1739983707;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XLcm+GYuwWup40Gm8eKU9GKMwCAH9+g9RxmfHL3bkfA=;
 b=R8y9LEmZfJp99LWuUBqdvXgzwbDpDAoJInnOCyf7SdZXRln6GJmf8U4SNf1zmK0jff
 k7Si4mUreJd/DRRCIjDCym9Vs4m2WV7FIg8YuOxMpX9vrKFc3vCsQfiH/rJDsC478qrw
 DQm1UCyk5TU74ps8uauZgO7ehwNQ5Tf/x9CaxV8T4Do5fN6Ic706lOJ5nprrWDPo8eFI
 RAI/KZbIyPZX4rvvK9g6CNhr659T/1G0aF62hEDvOvNdfQDXyB6ERh0sBnzsT9z9cryF
 4pd+s3RhsWRJz8kgKC2NiFC0HJVzON9aXFBzCAC21O3Ro49pgQMKRnXXt7rTfYSNptkN
 794Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl/hLXmIf7u8Ly7O3UIPwa1hb+bJC4MCP+rADtXjY7KipEUfryvHlicK87WU+X1Efpk7qh/yJbXuY=@nongnu.org
X-Gm-Message-State: AOJu0YzMaQJr+n1cdIsyJO5Ojff0EgUxqHZ0oMYXHQnCj6iXoQutvXG+
 UA2/JohPbuV5egBs/SNq4yQmo+05FEqyZS5DumWQWWsSKZ/+PPCTpaKxRw7jR4ZtWpKNfViwdO5
 CjWoOTo+d6BzY3lRnQIQfeRjNFuz9a0fo+VyJNVHv7f4k0gVJVSM=
X-Gm-Gg: ASbGnctV0dndbpEjeMH4fz6hthk0vs6iauJ/Hc7/PeVEq6TFUdURihD6HQ8vYg4nDy0
 G3wVkgtQKImf/gOJidGcMQJ8dwnyjRgucIAfufvEWFoTHMkB1RqTcARIkBnrz1qSeP/CDGush/A
 wS3u68VbXAzDea8kxupT9qUGNFFw/C+L6LPOHAhg2rAMaRbtUH7i43l/nSV7C9z5Rxp74Qi1lOz
 fdjIpai3Zi4nNDurd2D5KBMgYwt/7etipwJU2pbKnKbImhDf60V1FEwzvTYXezoCyd+QLGNEOV7
 /OMDcsg=
X-Received: by 2002:a5d:47a7:0:b0:38d:d946:db15 with SMTP id
 ffacd0b85a97d-38dea256d3amr3421638f8f.5.1739378906683; 
 Wed, 12 Feb 2025 08:48:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/3IzBLAkl3QS5/HsQIFGtVwPsBq+6HuVhGxay9cGnipnFazPxFwi6E73IAnlwNdF2xDQYOw==
X-Received: by 2002:a5d:47a7:0:b0:38d:d946:db15 with SMTP id
 ffacd0b85a97d-38dea256d3amr3421615f8f.5.1739378906260; 
 Wed, 12 Feb 2025 08:48:26 -0800 (PST)
Received: from [192.168.10.81] ([151.95.148.6])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38dd44c5e3dsm12558165f8f.62.2025.02.12.08.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 08:48:25 -0800 (PST)
Message-ID: <b3241aed-0470-41c8-ae82-e492fd3802ee@redhat.com>
Date: Wed, 12 Feb 2025 17:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] rust/block: Add I/O buffer traits
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, manos.pitsidianakis@linaro.org, qemu-devel@nongnu.org, 
 qemu-rust@nongnu.org
References: <20250211214328.640374-1-kwolf@redhat.com>
 <20250211214328.640374-7-kwolf@redhat.com>
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
In-Reply-To: <20250211214328.640374-7-kwolf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3FfIhyw-prB7ggSsqZo-CIKQc60dF6USyFyzL63tVvU_1739378907
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Wed, 12 Feb 2025 16:48:32 -0000

On 2/11/25 22:43, Kevin Wolf wrote:
> +/// Implementing `SizedIoBuffer` provides an implementation for [`IoBuffer`] without having to
> +/// implement any functions manually.
> +///
> +/// # Safety
> +///
> +/// Types implementing `SizedIoBuffer` guarantee that the whole object can be accessed as an I/O
> +/// buffer that is safe to contain any byte patterns.
> +pub unsafe trait SizedIoBuffer: Sized {

This is similar to the ByteValued trait in rust-vmm.  Can you name it 
the same so that we can later consider replacing it?

> +    fn from_byte_slice(buf: &[u8]) -> Option<&Self> {
> +        if buf.len() < std::mem::size_of::<Self>() {
> +            return None;
> +        }
> +
> +        let ptr = buf.as_ptr() as *const Self;
> +
> +        // TODO Use ptr.is_aligned() when MSRV is updated to at least 1.79.0
> +        if (ptr as usize) % std::mem::align_of::<Self>() != 0 {
> +            return None;
> +        }
> +
> +        // SAFETY: This function checked that the byte slice is large enough and aligned.
> +        // Implementing SizedIoBuffer promises that any byte pattern is valid for the type.
> +        Some(unsafe { &*ptr })

If you want, the function can be written also

     // SAFETY: implementing SizedIoBuffer promises that any byte pattern
     // is valid for the type
     match unsafe { buf.align_to::<Self>() } {
         ([], mid, _) => mid.get(0),
         _ => None
     }

(trick stolen from rust-vmm, in fact).

Paolo


