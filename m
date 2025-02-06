Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tg0CQ-0007hX-C8
	for mharc-qemu-rust@gnu.org; Thu, 06 Feb 2025 06:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg0CE-0007YT-G7
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 06:37:28 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg0C9-0002Bf-9E
 for qemu-rust@nongnu.org; Thu, 06 Feb 2025 06:37:24 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so7828645e9.1
 for <qemu-rust@nongnu.org>; Thu, 06 Feb 2025 03:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738841838; x=1739446638; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5VRYtZ8A2Hx3mPjrXktacs5lE0DqixVFFnkf2kuyqSo=;
 b=UTJzO3MJfZPIeGjqaWuKABLYERVWliuKDoV1KnHApVrd77c6+XLXp0ItTJZXhV111/
 A9diJruqrUFLGHuft3Ks9nFhQi9FiaS6khuSQysUhDobWUk7t2tLQvyRcJrknGrO1n2j
 YmonQFQpO9XwNkY1BwJOE8aZ36PWHAyXEOhTONVul/99y+SsMjgY/LvC7UQEdvtde0JM
 rTS0aH/mN8vawkLG9SzwgQYeyKzdhPywhlM66k22t+Y1JkqHbPw9QqgAlxXxUXM4E7RO
 CcuxeKYB+LHBXqVYIDrtqxqr+if0d+cQq7A45/rp3jnq5l1S1pk7a9nL/B5Uk6LC3/Zp
 XetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738841838; x=1739446638;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5VRYtZ8A2Hx3mPjrXktacs5lE0DqixVFFnkf2kuyqSo=;
 b=XiEQ5vA1W6ZOYckBoylZ1lQ6EaI0sE8H54+oSPBjZ7EzF8/J1w7hJ2NB+FVoEb0yrb
 wHmwYC5CIyWlHDKqJ1hLHrwo3bi8A+XmxM2+QO4+cC8POF5Gsxx3etyviztt7RrNARxh
 5MuspdTirvak9rOTVdZvjHXReVjj5pczRPoBQG1o5QET5WCYxVb2flngZDrgOFCVkkGH
 XpzYV84mgceMkbGYGufhNLYE6LnQwL5M/zJW8GnqoRMdVXZkKBfmEJ0yn5jbJp0mBriR
 qrZaUYFj4BDLkHQkjl2U3ROTOnhC5+ucVT7MfeeJpZxKCxKcqSQiMCQR4v+hqvkHkcCu
 Ebqg==
X-Gm-Message-State: AOJu0Yy+fyu/DWsz0DBDiUUs+sc0aO8pua3VPZf0iClqHev0ilvdzi2v
 At7u4NXKRE4+6v8aiknWqGxJxs0o/GaL8Mu75GFp+S7FeqjVxizMmBuWOS3NC18=
X-Gm-Gg: ASbGncsEkt8fktGIUGZsFikBXTUnFXlgKqsB9TAtkfGOgy0qppmpXXGx+TwgTsH4AeG
 X9SmzjywfYM4sDImXoiWgdAhMyK0XuQ2/Onn7+xeEb/Txff46RzIOfeIlf4flFq/isLIfXI8kDs
 MUJK0rr8o4+Un41z/HfmtxwAnA8AcSe2q8em6x9t5DoHSXhRTqe7vu2iyBuE+WqJl+ZRBrRJ90i
 TKzECNrNT4alb2obvmr9tNp4R29EQw9/P6Sbo7IwdGjrSzbxMR2Em/hDvyyQFvACT0ENswSLwF8
 PjlyN4z17VLJTamoFM2v1ghbuYlfyCHDebkFTnwfSkK0IqjZ60Gy/Jo1ZdA=
X-Google-Smtp-Source: AGHT+IELu6Je7WgWWWBTlKn28mKM9F4JDWhUMDYiOkkRcMccovqsEWCYyRxBnPl9hTzQ3cPEf0wbIA==
X-Received: by 2002:a05:600c:3111:b0:438:a20b:6a2a with SMTP id
 5b1f17b1804b1-4390d43d9b6mr61169915e9.14.1738841837782; 
 Thu, 06 Feb 2025 03:37:17 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d94d7d4sm53535695e9.10.2025.02.06.03.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 03:37:17 -0800 (PST)
Message-ID: <298a7473-e5e5-418d-8902-2cbd30730db6@linaro.org>
Date: Thu, 6 Feb 2025 12:37:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: add --rust-target option for bindgen
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, qemu-stable@nongnu.org,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20250206111514.2134895-1-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250206111514.2134895-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 06 Feb 2025 11:37:34 -0000

On 6/2/25 12:15, Paolo Bonzini wrote:
> Without it, recent bindgen will give an error
> 
>     error: extern block cannot be declared unsafe
> 
> if rustc is not new enough to support the "unsafe extern" construct.
> 
> Cc: qemu-rust@nongnu.org
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   meson.build | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 2c9ac9cfe1e..131b2225ab6 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -4054,6 +4054,9 @@ if have_rust
>         bindgen_args += ['--formatter', 'none']
>       endif
>     endif
> +  if bindgen.version().version_compare('>=0.66.0')
> +    bindgen_args += ['--rust-target', '1.59']
> +  endif
>     if bindgen.version().version_compare('<0.61.0')
>       # default in 0.61+
>       bindgen_args += ['--size_t-is-usize']

Should this be merged directly on master as build-fix?

