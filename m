Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJGcq-0005nP-Bk
	for mharc-qemu-rust@gnu.org; Thu, 05 Dec 2024 13:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJGco-0005nA-Nx
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 13:30:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJGcm-0000FJ-6k
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 13:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733423450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0EV2Pl0XhfhPDgKftqMIgmpyNoNxcUWIgGvtN1nSogc=;
 b=iY+EK6E9azj+eGct9Nwk19ufe3OiNeoR3M7BWbZ2GqBNCBTgJpf8D9zKuLc1iOSFPMpNAE
 MXqDvKD/TmShqMqR4YSBNlCy/WOZ8riUs7Mock8jAlMw+zJssFm4FKjzxYCLrD1T6hlDEi
 CNCNtaHPzzmkf+FdVw7+1Yywiomug30=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-ubka1bF1PkGxlRUQqrVBkw-1; Thu, 05 Dec 2024 13:30:48 -0500
X-MC-Unique: ubka1bF1PkGxlRUQqrVBkw-1
X-Mimecast-MFC-AGG-ID: ubka1bF1PkGxlRUQqrVBkw
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3ea305e40ceso1318165b6e.1
 for <qemu-rust@nongnu.org>; Thu, 05 Dec 2024 10:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733423448; x=1734028248;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0EV2Pl0XhfhPDgKftqMIgmpyNoNxcUWIgGvtN1nSogc=;
 b=YqIqc3idv/1qZO20Y26DcWMZV+F3FxDF5EdN4+Q9pAMwYIIUykWFuZnqP+cCjzRbDE
 2YjqGl0K53dkh7+KJlGDuk5Ytp3I2rKCECIyuaR8hgXUt1LGnoWBYeHZujk/d4vZrXJq
 A5gQdDlMiWYBZ35ubrD2zS+EeM1iGvMi/LdlqPaqYoBhJZJMPgX7zXXEaNIF9ocAufun
 1FNGAwd/BXW2qDuuPCzPeASWzu+aF6/cob6j2qzhGQCcZAmkqbT/n5+B9vWCrNl48L4U
 kaYAfFs4nAZQMtwPJy/K1AodAC8evKIhUrXTJ91Ak9YMMj0xTym9pSyttTtgrlZD1i/m
 Aaog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn5WybNhRXyAmTPUglqmYIuWmDsZszZOvq0dz/w3Cdcsf2NJA6Mka5F3Vz4iBH4oNTMD626suZJZ0=@nongnu.org
X-Gm-Message-State: AOJu0Yxsn7x/Wh24XjmP/+qtVL9FYA8AZ3BndvpyYSJTEpQxAaNCQm0w
 SSvDZgN2w8b5Cs1UCwgPIUrKFIeL4jWJWNRcBWf90J8KxE5i5ZcHCJVsdJWuOnfzY+oNsS8pPv4
 6yqUSlxu562O7NqRRuHm2OJoH54asCDt14TU2YUl0oF4zAk+b1C8=
X-Gm-Gg: ASbGncsArtkZV7bpK0d+dM2vU6L6Siv6PQp+KkmShbcMUkNTRfHeFvSFu0j8r47whO5
 2m3Pc4yhbr3FJWM9u2XrcgwpJ2ieqr+1w0jxoOGEc9UbH1FgDKhBxT9vta+5xaRSV2KUtsk4+yl
 SqRkpnzCgH7k49kwHpl6CTfilx91crrpV6234pZOjiM4+6Flrqem2D8OkOfQAKmjdAfxTeOA4UZ
 v34092J0gHeEMuV/t3ksqAAcyEjxV59ncWAH2+l05DR15NsuJeDsjA/
X-Received: by 2002:a05:6808:e88:b0:3e6:5761:aea with SMTP id
 5614622812f47-3eae4f2d456mr14144176b6e.10.1733423447968; 
 Thu, 05 Dec 2024 10:30:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbUowyf/omcVXPrzm5frtjBkRRg4AJOqATqSbWoO+I1+y3GvLe22q5ojWMQemsIE4YCpc3Gw==
X-Received: by 2002:a05:6808:e88:b0:3e6:5761:aea with SMTP id
 5614622812f47-3eae4f2d456mr14144134b6e.10.1733423447627; 
 Thu, 05 Dec 2024 10:30:47 -0800 (PST)
Received: from [10.195.154.128] ([144.121.20.163])
 by smtp.googlemail.com with ESMTPSA id
 6a1803df08f44-6d8da9fd389sm9028976d6.79.2024.12.05.10.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 10:30:46 -0800 (PST)
Message-ID: <1f008c2a-aaf6-497d-becd-f36f5d9aea17@redhat.com>
Date: Thu, 5 Dec 2024 19:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 06/13] rust: add bindings for memattrs
To: Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-7-zhao1.liu@intel.com>
 <b34733f3-1525-4e35-8c07-f84ad56b01e0@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <b34733f3-1525-4e35-8c07-f84ad56b01e0@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uLmGJ6DbAR52Xxnr1q9zSNnSIdAprZBq48FZVUN_Az8_1733423448
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
X-List-Received-Date: Thu, 05 Dec 2024 18:30:55 -0000

On 12/5/24 19:15, Richard Henderson wrote:
> On 12/5/24 00:07, Zhao Liu wrote:
>> The MemTxAttrs structure is composed of bitfield members, and bindgen is
>> unable to generate an equivalent macro definition for
>> MEMTXATTRS_UNSPECIFIED.
> 
> I'm happy to move away from bit fields to uint32_t or suchlike to enable 
> MEMTXATTRS_UNSPECIFIED be a compile-time constant.

Yeah, if we go from

typedef struct MemTxAttrs {
     unsigned int unspecified:1;
     unsigned int secure:1;
     unsigned int space:2;
     unsigned int user:1;
     unsigned int memory:1;
     unsigned int requester_id:16;
     unsigned int pid:8;
} MemTxAttrs;

to

typedef struct MemTxAttrs {
     uint8_t unspecified;
     uint8_t secure;
     uint8_t space;
     uint8_t user;
     uint8_t memory;
     uint8_t pid;
     uint16_t requester_id;
} MemTxAttrs;

is still decently packed and simplifies things a lot.  Zhao, can you 
submit that as an independent patch?

Paolo


