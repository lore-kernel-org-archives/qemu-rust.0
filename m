Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tNvMz-0007ok-Gf
	for mharc-qemu-rust@gnu.org; Wed, 18 Dec 2024 09:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tNvMg-0007ii-D5
 for qemu-rust@nongnu.org; Wed, 18 Dec 2024 09:49:30 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tNvMd-0002CF-PY
 for qemu-rust@nongnu.org; Wed, 18 Dec 2024 09:49:29 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so5639234f8f.0
 for <qemu-rust@nongnu.org>; Wed, 18 Dec 2024 06:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734533366; x=1735138166; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4kV0TrM5vXEjLmE4aVQ534+ohvFmNs1MBI0iT9dxc1g=;
 b=KXib3GcuspfWVrF8xmZQ5uXk27fjo+5iPTzqNzAaIwK4g6g2cgSoh5behhkh7nQDIn
 TOgjYp/EuC8NrHpOpbQn3kfSzCUhRxDe2IUXAGsBZSZjKobH5beQI76aJi5RQazLgUIq
 EPnGqyPtURLOa9Gp8N3hROPN+EQemUM6BLcYnVfpJxrXuB5Lop9ceCZzZtiux6ZRSWSv
 iaShFjOfkmVa8eDAVvD0qj0ipnxqAbYWpXqGIpNuRZUjmQFtpduZcMzRM3XUC2GDyBDM
 5GVtiiq9mYkkHtyAF01L4dNCejt3iJjXMf0coXDi+EuL1acTkwQqqxUHfMjZkxDyyslB
 C0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734533366; x=1735138166;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4kV0TrM5vXEjLmE4aVQ534+ohvFmNs1MBI0iT9dxc1g=;
 b=CoIWLde/FSJlYdjE69L8V7Sf3h51Ffgon+Zkreo5hnJMRXZuAJ/DOQtSRfsH/z8DjJ
 77w+1etW79dH/gxGpYmdKqsZ8rVcmlk2TriEIGmab/UxN7PYSnq8JyKpdhnjW2kmMvAM
 yYuKplXiTHBU/bAI2QqabzXxJZKbX6bLGXj4+4Owdk2VYG0JTu0bRYafj0t5W2pypuZB
 3sCYimSyATW/m/xbIjvckxAKNa1Td63WcUow2qfYdrFrtSW3nJ4R5YqI8Qg8VNnlUXSP
 7asVAL7aWLEb0+LbkiHL39yoUcJNAhSSF7ryVGUl9Jw9y1+nH157k0EHgHjJkCkPhFTu
 pDTw==
X-Gm-Message-State: AOJu0YxwOlrf3ok+LhymgcorShbScVhBq5wI+qCfUhDmN1EXloh3LQ8n
 UTKlW/xqbfSVVXDoisvGZmcIoDN+jTlc/MHpcjlxwu4x3pI+K2E+jWEXK1TwxCQ=
X-Gm-Gg: ASbGncta2ddya5/5t3jOJvssL09mxbqZQU/5MI/BBMekNWJNplZeY4xCKvtMAwgVhns
 5zcYAfBzeuRMyB5UtygNaFW/kiJ/shX2rm0fFkzOZLihQGjsXKGOiycnjAYsj0VSOJrEZsN7rRq
 LidiAfp75fYaNgvywrDsq+k20DjCvtHpRCjffEp0gd7hZyUQFtwPbbxLi4i1yjl/amTjeslQJJI
 /lQWU8Kl06WhsZs++iELdlZPHarEQ+WAR+DzkbfxQ31FfHBeT9qS9yEYZP4w+9cqPu3C2Dn
X-Google-Smtp-Source: AGHT+IFBRx4+vK2c46DM8pfUlmCHwxs107An27sJpE1PzAPVZFQ/oBHa3UqMV2jIqh+6YYWfDxMD9w==
X-Received: by 2002:a05:6000:1843:b0:37d:4647:154e with SMTP id
 ffacd0b85a97d-388e4d2f463mr3138723f8f.9.1734533366007; 
 Wed, 18 Dec 2024 06:49:26 -0800 (PST)
Received: from [192.168.1.117] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b11495sm22577465e9.19.2024.12.18.06.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 06:49:25 -0800 (PST)
Message-ID: <10443a91-8329-4501-96a7-9f40d9045ae8@linaro.org>
Date: Wed, 18 Dec 2024 15:49:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] rust: pl011: fix break errors and definition of Data
 struct
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
References: <20241212172209.533779-1-pbonzini@redhat.com>
 <20241212172209.533779-5-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241212172209.533779-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Wed, 18 Dec 2024 14:49:32 -0000

On 12/12/24 18:22, Paolo Bonzini wrote:
> The Data struct is wrong, and does not show how bits 8-15 of DR
> are the receive status.  Fix it, and use it to fix break
> errors ("c >> 8" in the C code does not translate to
> "c.to_be_bytes()[3]").
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   rust/hw/char/pl011/src/device.rs | 15 ++++++------
>   rust/hw/char/pl011/src/lib.rs    | 41 ++++++++++++++++++++++----------
>   2 files changed, 36 insertions(+), 20 deletions(-)


>       impl ReceiveStatusErrorClear {
> +        pub fn set_from_data(&mut self, data: Data) {
> +            self.set_errors(data.errors());

It took me some time to understand where is 'c >> 8'.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        }
> +


