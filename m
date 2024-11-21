Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tEEIf-0006a4-5N
	for mharc-qemu-rust@gnu.org; Thu, 21 Nov 2024 16:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tECSi-0005vz-Lo
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 14:03:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tECSg-0007Bn-Tm
 for qemu-rust@nongnu.org; Thu, 21 Nov 2024 14:03:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732215810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IWsjYsBnacBCJXffRg4TOMqxnT5yfzq3EAuSbjWJybI=;
 b=S2CMvj0s8X81lgKQ6/C2SvCSeUgA8jIEeNToqh0fEbRk1f049g788QY02L1LxGZ1P8yuwa
 AKU//oUip7/L6mPlZRmVOmXTVYqylMCGRjqoLUw+KAEABwwpUi0eRyssSTCD71EjVfoXg5
 LRutkAIsQ9wp32Mqy0HN25bmPIt6mCM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-D5g2PfAvNxaGrI-xTj8DXg-1; Thu, 21 Nov 2024 14:03:29 -0500
X-MC-Unique: D5g2PfAvNxaGrI-xTj8DXg-1
X-Mimecast-MFC-AGG-ID: D5g2PfAvNxaGrI-xTj8DXg
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b1786fe413so155253285a.1
 for <qemu-rust@nongnu.org>; Thu, 21 Nov 2024 11:03:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732215809; x=1732820609;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IWsjYsBnacBCJXffRg4TOMqxnT5yfzq3EAuSbjWJybI=;
 b=TRMtmIu+FFhFTVcz4cgV0taBsedse7exzKC8WrfsplKZpSc+/TMhJ783K0Kr3Q2KXs
 ozcj9s++qtZ7PP2RnIStr9fsv2JHglq95ubXy/e9Sb+OwpN7YIVBRTh9WV32gvk922sg
 JSsndR4j6P9iJOKRU7qUQ/hvk+AMpPX9tla+ojyaTSUba91rBCdFq7PbDa+hHe73qHDT
 ki5d3STTp4ms+sd8wxxkIiT2FXb8zsPDZTinXaHohpL+NA3gh/naNerDBxQEAzQw8SvZ
 NRtNJE6pxayV62XMyYpMPSvTHdt3RZhtMy6PmK6FX9N9A1lShx1uh3VoFuXbWjkEI28F
 SG6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcfQGl6d+KDO6k9XHr6qfhkwLcq88d0aexeb7x6GQtldVVL2KTJqnlsSx4nrdcL131VbvLKQOomr4=@nongnu.org
X-Gm-Message-State: AOJu0YxzWJ7gO4krfgNEjUI1AOXsxPXLSqJ6VaKGwb8ukutUj5HNC+iH
 N3w3HBzS2cXlZ2hqmvFk+HrLT211mR+yupvLQztjPWhy5ygLH4iLw7zEKRrRRujGq3hrp8haXhB
 gGfuru57Gi3I8FTIS0fqeBOZIg6u+nCErKxnUMxHrJDsbKFfxH/Q=
X-Gm-Gg: ASbGncsxTkqjSzTb/AACPr9nTQZr7/ih6qaSfOa/MnnKDLGPcKF1DeuHl7y0EmDhzUq
 O9IYAgBrwR1fIXtXHGOU1FxX2IJqDqQzBCTGZ4Zyjq1L2lWwoKJ0FdZMLW+hbG14JMiYlqbEcXm
 pqgmRVZGgXn8e/8HiBSie2F7Zdx+etUp/qh0Jpw47AOBcw0ELYv9Ezd8uv/EhNZnixfYe7DSr6B
 GHXcL76tsgwSQM8255aDGaiqThNLUHe1pjYqmzgdGZ0tA4XH+LZmVTukUDrjZg9JEDFaw+V0ejQ
 u8Q5UUGl5hnk
X-Received: by 2002:a05:620a:1925:b0:7b1:ae59:47c4 with SMTP id
 af79cd13be357-7b5144df608mr17487485a.2.1732215808806; 
 Thu, 21 Nov 2024 11:03:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHtb9v2vjJD63fr4taaXeKiAOviSDKVTL8jg6v/Xw5SLj8/2qfvAfWXgmR+w0x3gyqzbFAmg==
X-Received: by 2002:a05:620a:1925:b0:7b1:ae59:47c4 with SMTP id
 af79cd13be357-7b5144df608mr17484785a.2.1732215808471; 
 Thu, 21 Nov 2024 11:03:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b51415286esm8565485a.101.2024.11.21.11.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 11:03:27 -0800 (PST)
Message-ID: <2b8f6079-f2ca-471f-8580-43352437625d@redhat.com>
Date: Thu, 21 Nov 2024 20:03:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vb97FH4IUBemqPBMAcjiTteFpANNIMYBgGvSPVkQyaY_1732215809
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.14,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 21 Nov 2024 16:01:12 -0500
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
X-List-Received-Date: Thu, 21 Nov 2024 19:03:32 -0000

Hello Alex,

On 11/21/24 17:57, Alex Bennée wrote:
> This is a mostly testing focused set of patches but a few bug fixes as
> well. I plan to send the PR in on Monday. I can drop any patches that
> are objected to but I think its pretty safe.
> 
> Contains:
> 
>    - Daniel's clean-up of functional tests
>    - Another avocado->function conversion from Thomas
>    - Update the tuxrun baseline images
>    - Minor fix to the rust pl011 device
>    - Documentation clarification on identity
> 
> The following could do with some review:
> 
>    tests/functional: update the x86_64 tuxrun tests
>    tests/functional: update the sparc64 tuxrun tests
>    tests/functional: update the s390x tuxrun tests
>    tests/functional: update the riscv64 tuxrun tests
>    tests/functional: update the riscv32 tuxrun tests
>    tests/functional: update the ppc64 tuxrun tests
>    tests/functional: update the ppc32 tuxrun tests
>    tests/functional: update the mips64el tuxrun tests
>    tests/functional: update the mips64 tuxrun tests
>    tests/functional: update the mips32el tuxrun tests
>    tests/functional: update the mips32 tuxrun tests
>    tests/functional: add a m68k tuxrun tests
>    tests/functional: update the i386 tuxrun tests
>    tests/functional: update the aarch64 tuxrun tests
>    tests/functional: update the arm tuxrun tests
>    tests/functional: Convert the Avocado aarch64 tuxrun tests 

Do you think we could include patches 2-4 from this series ?

https://lore.kernel.org/all/20241112130246.970281-1-clg@redhat.com/

Only patch 3 lacks a R-b.

Thanks,

C.


