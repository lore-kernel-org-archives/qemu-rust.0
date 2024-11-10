Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tAW3D-0004RG-4P
	for mharc-qemu-rust@gnu.org; Mon, 11 Nov 2024 10:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tA9zF-0002u3-3j
 for qemu-rust@nongnu.org; Sun, 10 Nov 2024 10:36:25 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tA9zD-0004rA-L6
 for qemu-rust@nongnu.org; Sun, 10 Nov 2024 10:36:24 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso643217566b.1
 for <qemu-rust@nongnu.org>; Sun, 10 Nov 2024 07:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731252982; x=1731857782; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YmW6ZkvgSMNNTtw/YzDhJX5tLRLxjI6tTQQNSzGmjPg=;
 b=UkzmVjtQwjRuU/mnKk7xa8KWCPwDFsoiY6DguJPni/iwaKOUuCm/Uqs3+0WiCkd3RV
 CZD/Q9vvG4zcRMSsKROGBRHARX4FdMcsOpQvov7lMqMFzwrmWqnO5sQIAXqCTI4SdU+2
 hm0s4MFXrMfLliM4FwV5i1ugzJuHyatGh3ucDEsEdPGgsNNkTXWxiVA6xA6scB/zV4jM
 ncDaS4X/k2rckp6K1yesZGbAwIlPfo1hEp43QpjlV3iwo5BQTsssdyKmHewIazP7pWiR
 IuvIOpAX/N8+md5XrOnaZ7JmAJhCQC1ipAnOlxUjl3JVfMqs+CNGp18hJWbL1+JzYwYZ
 oQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731252982; x=1731857782;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YmW6ZkvgSMNNTtw/YzDhJX5tLRLxjI6tTQQNSzGmjPg=;
 b=lLN65+1gE+dys6cAYhWbK8iAfmVnRb7hGXegaokGqHKyoG0BmpJ4uiD7BY0L3dNLla
 hbRABwzQ8GBGEeFGHImJwVed64NJhxSSMwyUlkuz1degmpJi5JrGZD7VkKbyX2iDFKJq
 EDuJb3GzVF1hMXALdXP0h/jxvkX/okYCpWmEt3o9IHeXhjhIpuMzcwJobW580QjIFGBf
 lNi3refX1dNW4wgItce7lzLIe2UDLghLWgCNKhJG99xKj8uVWFaP6eKH8e90pKq/kh0B
 9RmCYHCl1sUxgpyYKOI9eb3GuZnEewpKSWJRrw0OV+SMGqcEfT1PmZOgGW0DlrhjM/7X
 pmxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk2af2izEhqsz0llvHb6/jq8cXpLiI1SDPc8xkLFYjVOGfAZ5w4VmFTv6/XzfFTkv09F6leyoxLIw=@nongnu.org
X-Gm-Message-State: AOJu0YxRpAyfbnl3PcoCWg2ODEFkKoxxQy0bwRaJG+2hY0z1Dgmz2iah
 FSYu0T/1Qj4fNdx1jnVdU6ZeElM9gxpm2wEPg1np/pTm5LGJbjG2SdTWd3FuqTc=
X-Google-Smtp-Source: AGHT+IGVIf/JZpDXqbUOdvMAjgEXDM0KcRugchMQaX5rx43DqzUQT1egkt7ivPlFKT4DD802tYc4vg==
X-Received: by 2002:a17:907:8693:b0:a9a:26a1:1963 with SMTP id
 a640c23a62f3a-a9eefebd0dcmr978432166b.7.1731252981582; 
 Sun, 10 Nov 2024 07:36:21 -0800 (PST)
Received: from [192.168.69.126] (cnf78-h01-176-184-27-70.dsl.sta.abo.bbox.fr.
 [176.184.27.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4c0e7sm487794366b.75.2024.11.10.07.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Nov 2024 07:36:20 -0800 (PST)
Message-ID: <3e3075c0-7555-4732-9f2b-4c0ad9b064fc@linaro.org>
Date: Sun, 10 Nov 2024 16:36:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: CC rust/ patches to qemu-rust list
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20241109-update-maintainers-file-rust-v1-1-f4daba6f782f@linaro.org>
 <aa360d5f-b4f2-4a61-a5b8-decc87a97a7b@linaro.org>
 <CAAjaMXayR_Ugkz76OuYe97tEKvHuuJA79f71GJA=zt8L=ESb2Q@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAAjaMXayR_Ugkz76OuYe97tEKvHuuJA79f71GJA=zt8L=ESb2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 11 Nov 2024 10:09:53 -0500
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
X-List-Received-Date: Sun, 10 Nov 2024 15:36:25 -0000

On 10/11/24 15:19, Manos Pitsidianakis wrote:
> On Sun, Nov 10, 2024 at 3:59 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> On 9/11/24 19:29, Manos Pitsidianakis wrote:
>>> As of CAFEAcA-ZQuyGTtG-vhRTEwpz0L4cpimNxkKix45Yw6gVHXozRQ@mail.gmail.com
>>
>> "As of [*] ..." but I'm not sure about the usefulness of "like
>> qemu-block, qemu-arm, qemu-ppc etc but", maybe scratch it?
> 
> I definitely find it useful, for what it's worth. It's an all
> all-encompassing topic, like block or arm, and some people are
> interested in keeping an eye on those topics if they are not CCed on
> the main list.

What I meant is to reword as:

   "As of Nov 2024 [*], we have a new topical mailing list for Rust
    related patches. Add a new MAINTAINERS entry [...]"


