Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJDfY-0002Pv-Iz
	for mharc-qemu-rust@gnu.org; Thu, 05 Dec 2024 10:21:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJDfW-0002PV-NT
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 10:21:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJDfU-0007KQ-Ks
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 10:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733412087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bIoqRXZ/B1R564DTsFfbTZhSWQBt47EHzZvf61i+qT0=;
 b=duLwvWfZoJcyiLt2gM/qNT7x2QBHuVAFb5HrVwapN4ws2EEAU8j3KCH4GCrTTlRq5OxmTr
 K4D09U2Rv0zkM6A+OZpmbyznkDN8nKJiyEQav4TIRzBt+5+5o2UAcrLcuMTIh3Sc4XmyMI
 kzwAlTct5Q2GIlvdhFTvSxLiS9FCNT8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-EOGt_7atM46FqD_mnEGp0g-1; Thu, 05 Dec 2024 10:21:25 -0500
X-MC-Unique: EOGt_7atM46FqD_mnEGp0g-1
X-Mimecast-MFC-AGG-ID: EOGt_7atM46FqD_mnEGp0g
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6d88d5e89f1so19613816d6.2
 for <qemu-rust@nongnu.org>; Thu, 05 Dec 2024 07:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733412085; x=1734016885;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bIoqRXZ/B1R564DTsFfbTZhSWQBt47EHzZvf61i+qT0=;
 b=Jh4H6CxpCCc/l1RcxxqUua0HVCSQsZ9Ev6NeP1r1McatuNq2eOVqwGgw43Nvv66RTK
 MAVZfUE+ff5ngeRSzAVO/Xy87qTRfWwGZE7G8IBc2x8CzerUHS/R1OCrmNPfHav8EF1B
 ShlOi0SgvJeDvXJUHZrs5fLu9ex7zhLPstwSjS52o58o2KzwS2E2tQpk7GfwHqaKDj+y
 ba3+j9QKuHSnAGua496p6PfXqrjIcMEBxgo4mEvu6SDtr+5mbz9kJStsF2X5mNX2ykTi
 JPl8jlrAMnkXHbQgLT/vpJQyBrOz/LWxczW/8N+srlB6NTxs1dmRUHsI9akeVPf67Q7A
 rtPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo/7AMFZwX9P36iu78aLJdYzgGioa8GM1iYvuCi/HRSuoKNFnj317P1apR4/Mdd6aVWPcpThr5Yfk=@nongnu.org
X-Gm-Message-State: AOJu0YyxDSgKG1AXJhRao3GK+mgfbIYuz+m0Ki6TsC5lyDQ4821HyFja
 xQelz1e4xD7nJFfavtA6hZaNbvcfgmjv/W+WC7MduilffjnbYeiwGPIQz3vMRxwZOHZkfkD6PcV
 oOCTqcYx7It+KjmJECR+ApU7to4G4iZ1UT9Zt3A1jd50RJcmjYAE=
X-Gm-Gg: ASbGncv9B3vaxOPYRCr38+Le/SeDk8m1WAWtzM3sVWZzdpB3iyKoQ25RdAr+WyXwiA1
 pjSuueNzg49gahtn664SYrDY/VNLiPIJygY9tofTihzXLGhDz3LleDQRrITGGk4f86YW6dxHMW5
 hY+oGDA+RZnYkAMDFpfK+sCdpjdZu45Ca0LnJaYtYa2YmPgiqOxk7rQGBqS5+x6nxmvDfFfYtWl
 YRYaceSh4E4D5FJisvL9CvxPRfW54tIhcSj3g5J98QVuw/OGFTz
X-Received: by 2002:a05:6214:21e4:b0:6d8:a5f7:f108 with SMTP id
 6a1803df08f44-6d8b73a5492mr194198066d6.26.1733412084782; 
 Thu, 05 Dec 2024 07:21:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCk2HJ2Nj+RMV1gWbzGGum02m5IHJVQJtJ5SCJrcf8yb13NQnOEBV7IE1Sp4tl4vVml+WzQA==
X-Received: by 2002:a05:6214:21e4:b0:6d8:a5f7:f108 with SMTP id
 6a1803df08f44-6d8b73a5492mr194197636d6.26.1733412084501; 
 Thu, 05 Dec 2024 07:21:24 -0800 (PST)
Received: from [10.20.9.127] ([144.121.20.162])
 by smtp.googlemail.com with ESMTPSA id
 6a1803df08f44-6d8dabfa585sm7379636d6.99.2024.12.05.07.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 07:21:23 -0800 (PST)
Message-ID: <a76ccad6-5c8d-47e1-9613-9ac48df38940@redhat.com>
Date: Thu, 5 Dec 2024 16:20:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 13/13] i386: enable rust hpet for pc when rust is enabled
To: Zhao Liu <zhao1.liu@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-14-zhao1.liu@intel.com>
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
In-Reply-To: <20241205060714.256270-14-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: crKSqHqO85Hv7D2T-cqMEkODq4qwervgtU7e6g6FSI8_1733412085
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
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
X-List-Received-Date: Thu, 05 Dec 2024 15:21:30 -0000

On 12/5/24 07:07, Zhao Liu wrote:
> Add HPET configuration in PC's Kconfig options, and select HPET device
> (Rust version) if Rust is supported.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/i386/Kconfig       | 2 ++
>   hw/timer/Kconfig      | 1 -
>   rust/hw/Kconfig       | 1 +
>   rust/hw/timer/Kconfig | 2 ++
>   4 files changed, 5 insertions(+), 1 deletion(-)
>   create mode 100644 rust/hw/timer/Kconfig
> 
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 32818480d263..83ab3222c4f0 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -39,6 +39,8 @@ config PC
>       select PCSPK
>       select I8257
>       select MC146818RTC
> +    select HPET if !HAVE_RUST
> +    select X_HPET_RUST if HAVE_RUST

HPET is optional, so you need to have...

>   config HPET
>       bool
> -    default y if PC
>   

+default y if PC && !HAVE_RUST

with a matching "default y if PC && HAVE_RUST" for X_HPET_RUST.

Paolo

>   config I8254
>       bool
> diff --git a/rust/hw/Kconfig b/rust/hw/Kconfig
> index 4d934f30afe1..36f92ec02874 100644
> --- a/rust/hw/Kconfig
> +++ b/rust/hw/Kconfig
> @@ -1,2 +1,3 @@
>   # devices Kconfig
>   source char/Kconfig
> +source timer/Kconfig
> diff --git a/rust/hw/timer/Kconfig b/rust/hw/timer/Kconfig
> new file mode 100644
> index 000000000000..afd980335037
> --- /dev/null
> +++ b/rust/hw/timer/Kconfig
> @@ -0,0 +1,2 @@
> +config X_HPET_RUST
> +    bool


