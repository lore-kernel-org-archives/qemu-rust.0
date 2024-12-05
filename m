Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tJH3J-000651-IH
	for mharc-qemu-rust@gnu.org; Thu, 05 Dec 2024 13:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJH3I-00064J-No
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 13:58:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tJH3G-0002nQ-9o
 for qemu-rust@nongnu.org; Thu, 05 Dec 2024 13:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733425091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yoaqpBrTdGV/6rfncvj+awwhtmzVKW2lAyWKxB9lP30=;
 b=DPJj3ZR5koeMwU7M1uU1/A1Ar8wL0So7um1zVzM6+nzRuJ6xgPXuTyX919+TC69/08AgPl
 Z2gVbJ5LUwr+3RRWO6a1t2JTW+Jn0UOibkySCzsCANVeZ2OiXCRBge4oc12OoW8XBzU3zE
 8cJRpq39QZ9MwOygWQDthalU26gzlrg=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-5FKLQOh2NNuVzAFXQ0WQUw-1; Thu, 05 Dec 2024 13:58:10 -0500
X-MC-Unique: 5FKLQOh2NNuVzAFXQ0WQUw-1
X-Mimecast-MFC-AGG-ID: 5FKLQOh2NNuVzAFXQ0WQUw
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-8564f707b27so376641241.2
 for <qemu-rust@nongnu.org>; Thu, 05 Dec 2024 10:58:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733425090; x=1734029890;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yoaqpBrTdGV/6rfncvj+awwhtmzVKW2lAyWKxB9lP30=;
 b=EHA1y1alyHGekKgRWFED5Y1P8FTumUlBBrkKT/8BBm6teK18Y2+NFt0C0OFN1HoPUB
 N9UF+LEchpiP0sRgmbNkK0ybvTKQrB+8c4PmgO8d0ACOGlF7CMBx4E4rcTH07mGJnsu4
 dWsfcnrCrkoAW4dEnTmkPHAQuS1Ay/2maIfRT3TPXTRHhu9JP+UfaAeo/yetLdwMHXoe
 CadULqnwbUx86/0eHcqaJ6laF7eszp0JnJ+dQ8EQ3/6++amblzs+LAGBZRJO31fZjOkl
 tS+7yzhPkayvqNxo6O2JwJPwBJg+0+L/a5iBUpn5R8tqQPeoY8Ed+hxNpdxZT1N7UyYI
 NF1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuaAhn2oFOcN/5Me+/0KMpKGbhsbLHiX1Nb0nhCvOtdc3/T0kXjGpXSFGb6eE+ST3JAjj+VTEiTVU=@nongnu.org
X-Gm-Message-State: AOJu0YwGhsXyeiL0totsClXJnZhBi9YiJgfZKgOemTfWSxStzx++Gitj
 NJj4T8vfkZGTHRKvfrtBGt0B+buGDu41lcclFsK3zvi9rjhm59oBQdLoEBiV8sGVrJctb/7WL4/
 dtfw/3k47TB7UQl6OKvhBMjPMkaAP+oyiKx9fY6tg6kSmqaJVONM=
X-Gm-Gg: ASbGncvt6RLMqBxDJv837rwZL/jonQaNxhGodyK40p3zK3N+iUuXoqks6bpNrUAoyP3
 lbzbCLpm+4xRA7jnyosl65kNC2yml2P/o9pPltm2Iv7rMRDMLbAiIZ6YROJCUCrCyYXVUYpy0Fg
 3+jIs2gCX9AKUAo2AwRIh1dRD131Mv6IWm5NQWhI6DbxGU5umraaXJ6QYzAWczTnE4IMsT9p3zY
 9HodDiEkTvyr0aN7TvjhKg1QfDhWmmYn/I71fLVyjgUM+XCI+op0om9
X-Received: by 2002:a05:6102:b05:b0:4ac:fe47:1bcf with SMTP id
 ada2fe7eead31-4afcab15935mr618671137.24.1733425090136; 
 Thu, 05 Dec 2024 10:58:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHciEJXmweT5wEjvM37V7aJvVqOOBewbohri91X4XpnUNHh5+UmGr9AJTCvVPtiSCe14nm/BQ==
X-Received: by 2002:a05:6102:b05:b0:4ac:fe47:1bcf with SMTP id
 ada2fe7eead31-4afcab15935mr618653137.24.1733425089890; 
 Thu, 05 Dec 2024 10:58:09 -0800 (PST)
Received: from [10.195.154.128] ([144.121.20.163])
 by smtp.googlemail.com with ESMTPSA id
 af79cd13be357-7b6b5a5b6d1sm87025385a.36.2024.12.05.10.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 10:58:09 -0800 (PST)
Message-ID: <2345dbef-039c-4390-9671-75c8b529e13f@redhat.com>
Date: Thu, 5 Dec 2024 19:58:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 12/13] rust/timer/hpet: add qdev APIs support
To: Zhao Liu <zhao1.liu@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Junjie Mao <junjie.mao@hotmail.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20241205060714.256270-1-zhao1.liu@intel.com>
 <20241205060714.256270-13-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20241205060714.256270-13-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iav62nKHhwUR0KgsybUJrd-c-V2N8y2Oz-_a3BdWjG8_1733425090
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Thu, 05 Dec 2024 18:58:16 -0000

On 12/5/24 07:07, Zhao Liu wrote:
> Implement QAPI support for HPET device in qdev.rs.
> 
> Additionally, wrap the handling of HPET internal details as traits to be
> specifically implemented in hpet.rs.

Why not just put everything in a simple file to avoid the traits?

> +pub(crate) trait RamOps {
> +    fn read(&mut self, addr: hwaddr, _size: c_uint) -> u64;
> +    fn write(&mut self, addr: hwaddr, value: u64, size: u64);
> +}

Please try as much as possible to make these "&self", same for the GPIO 
handler.  That's the point of BqlCell/BqlRefCell. :)

Paolo


