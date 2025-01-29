Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1td3Pj-00087s-Ml
	for mharc-qemu-rust@gnu.org; Wed, 29 Jan 2025 03:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1td3Pd-00087B-Vk
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 03:27:05 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1td3Pc-00056E-EI
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 03:27:05 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385df53e559so4706643f8f.3
 for <qemu-rust@nongnu.org>; Wed, 29 Jan 2025 00:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738139220; x=1738744020; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AHZiF47NWWjd2AYAWKEbCROUr9QzBMOCZsoHUD8kiic=;
 b=iDYVDkLJ83OeZDxHDeVPjn8Ob6bmUSHDHDQDl+EKI+cjn9OBrsMbBi/Lw5iqjLcdpW
 a/SN3vjDu/Pd4Zxg3D/F8mJEy0v9rKG3CjrSfQLcnwOw1yXBwv7iI2BXY5i4cXM05aUw
 sNbxnKkvVo2XQz7B0lZLQH97h3DhgPU+xxXghins5b/KqQXLDrKzS2JJzVaOIJ26b9/v
 7QHjtHIloS81dwSPpApwGoj/dl/6QRg23PI7uLiwyl1WwpHj9B4786pRPzCOXTKO3VPG
 b6RoqAJOfWIqaObCqyjP28+zEv5MHPyrxGI48qcOog8AuanJPFw2oK87+QmZO0Xf246p
 dIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738139220; x=1738744020;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AHZiF47NWWjd2AYAWKEbCROUr9QzBMOCZsoHUD8kiic=;
 b=J+G1uRWzFNRVU+oRKMVkB8Yc6bVbW8JQJOnl0OLIy3uiwKffrpGCZ6ehByf9nWrcjG
 rTPVhPnO+zBwlM44YcmOb0XJt18O03XQBJpZBv6LXv4t/MVsI91dwn1fU9o6qG7Z1kq8
 nEiF7cG4tRdl2FsWIPPsqTmdaX8j5FpIp1BEXLtNM7AaQYnzSv7nWR8zbzE2knlygmGT
 FMmbq9jIDPmfQA41RTNL3UQz4xWFv2uxuKoKN0/sWenu2oEXnOPVVT9b4oK5texqCRXO
 i8Ry+MzjufR7dK1dZ8GUL/he6a6U8t/zvg8fQOUZUU+lDkcEwICUiI5EbV+mBI/eAwAZ
 yjrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJuGqT2fCVSQmNbk0H8h5z+pSzDXk3uRMRmTtrVaGMx3ur0ZxSJZDQm4rmfOfPOA9Z7dHuGiUhWik=@nongnu.org
X-Gm-Message-State: AOJu0YzfiymseCc2jl22whRecCKekQqaHG5r32san2jEYjB4nifEn9DY
 6on9Chi1IjyxG2myvTUDeVAwKo1lXUelaM8bVbEmq5U79TiK9vS76aop9pVCdsU=
X-Gm-Gg: ASbGncvgZiNqOF6QKCTbmRIK88CPuEQdRJSkRi3M/rlWHJy5cT8Z2b2ffZmv8hNii9g
 dAkqiSKBJO+8clwh7HeVTBHBfgKYYFp/rEZ197NA7ZA+3JTQuiA/c4oUvN3jRc6AT2u6ztwJkOX
 4IiNQeUEWBFbP7omlx+sJdHnpb5u04t75KOYHcTCk9YI6/bMEaAFkT8WIUL703pRQR18t6/5/JB
 FhQX/h8PEWqnD12opk77YE8TOYPerSMmO1c3WyjiZao9xohKR1WkOJ7b4lsOOjJ1S1fD3FPFme9
 RPp6BWGv9rATUkg1AJUuhK9owa3YWAXrgK8cuKCxjdyysQx7cF12Ykw2QXc=
X-Google-Smtp-Source: AGHT+IEqSd/3rz5Y5ORNplSWaBL8eAnVT8r6p3lyhI5cOv8lRtUUgyZW149RH7IvKocqdgMyJ9Rjsw==
X-Received: by 2002:a05:6000:400e:b0:38a:3732:444d with SMTP id
 ffacd0b85a97d-38c5195c27dmr1733276f8f.23.1738139219814; 
 Wed, 29 Jan 2025 00:26:59 -0800 (PST)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc2e3a6sm14299365e9.20.2025.01.29.00.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 00:26:59 -0800 (PST)
Message-ID: <22ef753c-60d8-4e21-8317-e64b6d81ff5e@linaro.org>
Date: Wed, 29 Jan 2025 09:26:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gitlab-ci: include full Rust backtraces in test runs
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-rust@nongnu.org
References: <20250129082045.1319203-1-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250129082045.1319203-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 29 Jan 2025 08:27:06 -0000

On 29/1/25 09:20, Paolo Bonzini wrote:

Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index 39da7698b09..4cc19239319 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -63,6 +63,7 @@
>     stage: test
>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:$QEMU_CI_CONTAINER_TAG
>     script:
> +    - export RUST_BACKTRACE=1
>       - source scripts/ci/gitlab-ci-section
>       - section_start buildenv "Setting up to run tests"
>       - scripts/git-submodule.sh update roms/SLOF


