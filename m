Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tfxO6-0004RI-VA
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 03:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfxNu-0004Mp-Qe
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 03:37:18 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfxNt-0005iD-DR
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 03:37:18 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38db104d35eso430361f8f.1
 for <qemu-rust@nongnu.org>; Thu, 06 Feb 2025 00:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738831035; x=1739435835; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9OCOaRltNue5Ngv30f5dYaLHviUSZEC0cNjJfmBP3lY=;
 b=nkVxqp5Aah17fEc80yJ1mL/ttNGqJLpuMlUV30ril45sQkxDkiezENTJzq/QxKqPfY
 ps+NyB/QFbi1cZogUt3UKY2hTe6G4y8c2fBJoysBPHaYUgnfwIDJVD21lGK+voMCZRH3
 raSoJzt0zku1FrIFpS8X6/7BU19dV1PUUOfC9eeqpMGY0H4l6ttiPkniOpZsPYf6YfLd
 /5P3LL8s87oWD+RtvltbuXqdnoMKnFGk2GQ4fDVVrkUeKYAbTcAR1RLA7u237TL+duc0
 V9F+yUK7ZX/IOSFo89WlSZvxftr36vbVus5lU5/wqqkaOmzpx/OB8O7rPWMEbo3uq7G/
 guOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738831035; x=1739435835;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9OCOaRltNue5Ngv30f5dYaLHviUSZEC0cNjJfmBP3lY=;
 b=sNsBQ6xjPrbWdfju0Mj3cICD125SfamgVF756jVO6u9spbyGGNW/fN9hh+C7ATbrcd
 qS3u6oxABv1Juny4uPL1zQTgEF7jkK+8aJVLhBf8IKmLoPDlPg912Fu0nxrJn5iCtIkS
 vpeZ1cSS5c0/mhXT+jbvTQVOMzJjHFf2bbFb6W0fAgYs0B6xvCuFZfXPstsUk5oKDOtt
 goGP3smTWci9bpSZKF4/qaPs7UIAlh+DPMfO9jsWfzesC7AJRhOQ4ZzwQh2F5fjgiIJF
 m7mGvGSH8WeleV9fYJfqaz2cGqQda2YqWmqfpPZ8VwNwxb+9b1XqV6tkiM2lkkfh828Z
 pVRA==
X-Gm-Message-State: AOJu0YyK3B2bPUVJCdyi3UBpx/1J1RmuBFXaQwxLHqgpoJSVSkSn1x8n
 bpLWktJviEecQS4kNG2vB7hLRZwwpkx0vyTAtZJ2dg81ujBrNF848NnnY7xDBxg=
X-Gm-Gg: ASbGncuOhOIdxq7vxwMznxF56T7hHcdDcM3QXpXcJ6vFZNxpUDByhXIK6RVlGfXzsp5
 7l3+JEsIuoK8qLppF3vXxGmdDMB8TbY/gRda0Sqj/9+3QcTTLCz52OSmwv4PfHTuzRqMEZj7knQ
 nLe1cM3sm7o9k2S6/uQ2Ux/2TPJ9h5ylkZLVadMXSwG5zjNo/LIdd5Q1xQOmB3gJIX2bnmw3py2
 ULWQEJk6C0vOtonHUnNZmch+VxmWL62RQVaG7NhPPY+L3Trek4ePDGXW/1jeSlLNz7d0TRn3GcF
 28lOuRQ3ZRunRoCRkteanFbMc89kI4049I+sIR+nH3PTIvbhb19AcXUHtVE=
X-Google-Smtp-Source: AGHT+IGX9l2Ei3H3nwhlummAg9aYuRGdBKC3ztY+UjetgIiKNmf953A75YsCG2S7j8effw7LLqqdlQ==
X-Received: by 2002:a5d:6acb:0:b0:385:d7f9:f16c with SMTP id
 ffacd0b85a97d-38db4912832mr4152331f8f.46.1738831035200; 
 Thu, 06 Feb 2025 00:37:15 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbde2fc01sm1101935f8f.93.2025.02.06.00.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 00:37:14 -0800 (PST)
Message-ID: <3de1e53e-e36d-404c-bab4-a648bb7fdbe1@linaro.org>
Date: Thu, 6 Feb 2025 09:37:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] rust: qdev: make ObjectImpl a supertrait of
 DeviceImpl
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
References: <20250117194003.1173231-1-pbonzini@redhat.com>
 <20250117194003.1173231-8-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250117194003.1173231-8-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Feb 2025 08:37:20 -0000

On 17/1/25 20:40, Paolo Bonzini wrote:
> In practice it has to be implemented always in order to access an
> implementation of ClassInitImpl<ObjectClass>.  Make the relationship
> explicit in the code.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   rust/qemu-api/src/qdev.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


