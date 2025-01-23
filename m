Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tazDY-0003Ml-2q
	for mharc-qemu-rust@gnu.org; Thu, 23 Jan 2025 10:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tazDR-0003Lt-FA
 for qemu-rust@nongnu.org; Thu, 23 Jan 2025 10:33:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tazDH-0002Mw-Sq
 for qemu-rust@nongnu.org; Thu, 23 Jan 2025 10:33:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737646425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3+cyrcuOIwl+NyJWj6oDQo1ooJ1FM5G4u6uSe0Fo3A8=;
 b=jK0/sLLtVajxBcpXEyCk0YLiK9WaWkRaTGwSr61yGuemIWntSPu30K3nfoWuBlCEzraf6/
 GJFGXHuNDNfIO7mVpTaIV+uDfosxl3mVPbsupLZebQIFb5jO18B4FUOhWBP4qmUYdxq57R
 84j6PIBhT3lYb+SomFXpDCuhRKB3gVc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-Ew9-1XHYNdGX4nStTvjZ5g-1; Thu, 23 Jan 2025 10:33:43 -0500
X-MC-Unique: Ew9-1XHYNdGX4nStTvjZ5g-1
X-Mimecast-MFC-AGG-ID: Ew9-1XHYNdGX4nStTvjZ5g
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385e1fd40acso647907f8f.3
 for <qemu-rust@nongnu.org>; Thu, 23 Jan 2025 07:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737646422; x=1738251222;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3+cyrcuOIwl+NyJWj6oDQo1ooJ1FM5G4u6uSe0Fo3A8=;
 b=VuO9OxX7lVGcqbm3tsMtkVtVBWKLgRB2nV4m9AwjgkrVEeigD5PSVUD28RHFhD+tQP
 CS4bjlnR0o0IWXaHfclEOPEbWu+X0dR1jznG60LHsHR/oz/1v79rTjbT1BXmOvT8pddw
 qj7z9qzuSej5KKly2/01Cl+kXH7Lyfa4gS/e/H7EOFxVMVlCi3Qrzkuz4aokw61oHD5E
 Rox/FdKWpkdNt2DeDkUI9PWm65mSvrdLLJi9K4dwM1VjIrdkh1p0pQ7vBgUEyzSZWAmT
 H47BDuKT6Uls0VaApbz6cDrfh/mlfNAW4fhTEYacIdgadF9ZyjDlvTXcktZglyl0NSEz
 xxxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1u8vsFfW0FvgOKXyfs2EJ8c6JB9MdMqhOvWeXq9A0FImZBn4AwQNkWyTbLUQCQnd8uedFId1dvMU=@nongnu.org
X-Gm-Message-State: AOJu0YzV9IH1X6RFlbDDjW3mZ9JG9THy+eQ2hsy0Uxc8XmSySrNmT402
 Z9cjaQu+/nj01ckqnElx36WJILa3RmYtzLztCiuLRZ9PwWVBPOT4F9KrlazHCTcr0fw/mAUMjEf
 ZPbn8xfvL2pnyRFF3+TyhHPJtxeAFomODGFVBxksK+0mt3dKM0XI=
X-Gm-Gg: ASbGncuj3lSzwM1jAg5E6L31NUOPIdniOP9OhQwMhofMFN6At1TEZSHPDlnGlcvgQEs
 6QmtJEcsShzkTL1lUEiS8vMWTXXs8d9J/3WVUpe0XpH67ZlipVdWn6XSEqN1tzMLyuTXIawABOZ
 QZYk7gfvNB/V6g/Yi+4CzouwluTUB+8ap/bY6qpTpYKa99gmJTCCBgYz2JRVIHg4j10Wzt66ppb
 c+sekg7OS4tyL808FDYDTbsO0eyVNO4KiakxrYNLfAPK8e/cIaI61TLf1SVlybG9ER9lAxMZw==
X-Received: by 2002:a05:600c:3149:b0:434:e9ee:c2d with SMTP id
 5b1f17b1804b1-4389144eee4mr215208175e9.26.1737646422471; 
 Thu, 23 Jan 2025 07:33:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3jYWFYyjcyo/8YRYcqQFvsC5xwopDikQgSgwFD5L1YusdbZTHF4r8sBiLeLxz07zTK0THZQ==
X-Received: by 2002:a05:600c:3149:b0:434:e9ee:c2d with SMTP id
 5b1f17b1804b1-4389144eee4mr215207915e9.26.1737646422068; 
 Thu, 23 Jan 2025 07:33:42 -0800 (PST)
Received: from [192.168.10.48] ([151.95.59.125])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188fd0sm3230f8f.58.2025.01.23.07.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 07:33:41 -0800 (PST)
Message-ID: <5e293daa-474c-4af2-98bf-9b995805b454@redhat.com>
Date: Thu, 23 Jan 2025 16:33:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 06/13] rust: add bindings for memattrs
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-7-zhao1.liu@intel.com>
 <b34733f3-1525-4e35-8c07-f84ad56b01e0@linaro.org>
 <1f008c2a-aaf6-497d-becd-f36f5d9aea17@redhat.com>
 <CAFEAcA9SCfMcrhpd_x0LmgwtD-5XwT4TY+QXBJMOjWbdtBPCUg@mail.gmail.com>
 <CABgObfZSR2s5AYEAcJfsdF0jKQGf_AVcDafKQq47qzLmBuX0RQ@mail.gmail.com>
 <CAFEAcA_dVnpN2Vn+VAf1XZSAdj183wJhQZ3pVNtb=NHeMOF2Jg@mail.gmail.com>
 <CABgObfaAdDtrLF4tWL17Lmw9UKiLRNVvuiDZsQxc-9Wd8W61Dw@mail.gmail.com>
 <Z45/MNYY5jD5fNET@intel.com>
 <e2920049-01c8-4ea2-8f52-b99ed0a559af@redhat.com>
 <Z5Jb7k3LLcYY5ZG6@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z5Jb7k3LLcYY5ZG6@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7W26dj6Qi_8ImyLcJabO_I7yrj_ZJjWHfTxMSYOIIks_1737646422
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 23 Jan 2025 15:33:59 -0000

On 1/23/25 16:10, Zhao Liu wrote:
>> Another solution would be to implement Zeroable for __BindgenBitfieldUnit in
>> bindings.rs, but this is much nicer!  It works even with old Rust versions
>> and, even though it needs manual implementation of the trait each type, it
>> doesn't require enumerating the fields one by one.  So it's better than the
>> current version of Zeroable and, if you wish, you can also replace existing
>> implementations of Zeroable with const_zero.
> 
> I'm working on this, and it's just a simple patch.
> 
> But I'm not sure why Zeroable needs a Default constraint. I think Sized
> seems to be enough, doesn't it?

It's not needed but I think it makes sense semantically:

1) the idea was that Default::default() would always return the same 
value as Zeroable::ZERO, apart possibly from padding.  That is, for 
something that's Zeroable it should always make sense to use an all-zero 
value for Default::default().  And since there are standard library 
methods that use Default, the bound makes it possible to use them and 
know that they fill-with-zeroes.

2) I wasn't sure in which cases bindgen doesn't generate Default, if 
any; and with Default as a supertrait we'd have to double-check the 
first occurrence of a non-Default but zeroable struct.

Paolo


