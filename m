Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA94BD2502E
	for <qemu-rust@archiver.kernel.org>; Sun, 11 Jan 2026 22:25:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vf3sG-0002JR-Pw; Sun, 11 Jan 2026 17:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vf3s6-00027i-S0
 for qemu-rust@nongnu.org; Sun, 11 Jan 2026 17:25:18 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vf3s3-0001cD-Vf
 for qemu-rust@nongnu.org; Sun, 11 Jan 2026 17:25:17 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-29f102b013fso56127795ad.2
 for <qemu-rust@nongnu.org>; Sun, 11 Jan 2026 14:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768170313; x=1768775113; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+CCFLvfHluJFdfCNdY2F37e7Xb8TpmPuEJpC0XV0SKE=;
 b=tJ9WEbbdSRzod7E76sXBg9bT21LjDwUgN5rVpegr508ZuGac7ZBuP5QNSVB2L7Tnkq
 rVklVGzC4BD18/s9Haj37nHesTPYFry5rO4CVuwFN7RP2PVFiaQFjJ5mqMohWV6OeoJF
 bWsG6SuJLf/LpG0PD3IoMu58qPN8dfqKTeKKmU83NNFyH8u3eeZseMGXE2XlRL1xIPSH
 iBs7R4U/fS53YygCVda3Jfwlig1EkW3iLz1Zf2a0NfqAV/qNnVtFzmIgdslAlRz9oAXS
 gYRlBKQn43Azz4i4ukzNe9n+X2ZmSbACQqnFw3crfAlvmRtTpBrpP2q+GpqDVKHsqI/t
 w8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768170313; x=1768775113;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+CCFLvfHluJFdfCNdY2F37e7Xb8TpmPuEJpC0XV0SKE=;
 b=qMeG5ib75omr2nW1FpSAYFNHnJ6iXPPN6K7ZrOOsq850lihtoc/wDDEmqs77YHH5rs
 uXLDYAfWb01V3oHLxbqYlasiMI9WPNKJvlojU9iIZkHAdQeKJAQf6RBLEj7SXilu2kaS
 k9gRQFzPUEwUIUiijCCihU0dtAeGC6dwXkM9rautND0o4+sw46xqLlHVbmF/c5i1ykuB
 891qF4GJMIrpBtqNbYI49/KgzQLEob80sMxjXQ/rm+doh92aE2ygCzZRfLTLPZ8qGy2r
 HLMHe9vktykKAnSNCApO2DdIoVapHQIGWsILpsbCZPba3BQf0pUJE/jcL1Kwjt8x4eGp
 A0yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrs8jhLLNzSl59hSU1hotzpZxlyHyDoM3fNRtpZ80g1ya3K47yyCLmFaeR9K5aSyFJiHLRkSC+XqU=@nongnu.org
X-Gm-Message-State: AOJu0Ywp5zRY5A9UAulErkewu0goznGSrNvZgXLMkVZs74EGI5/mS5xD
 TPR8HooJmm5i1srV7fs0gVptbNP/03plDV0KuImmEaq/kDT58n+qk9bE4g0a3XSnmFo=
X-Gm-Gg: AY/fxX4IvgEe7mbxjaOn5GYGERqUKER95ojL5IP4dOHzkIQaire+aZBYuLrncoyCF/0
 5g7THNv/iwpcQp5/m7tXcw+UobDfmlPPkDQwaSm92uLv3+UlDb2HoJoIEAjIJiD6/G0fZs84c1h
 dldywCvnBWI9d0nkFJFx/QUsoC5oJDZ84/WJ0KVC5gHRJkDfT3tzyjd1RPd5yEoAuHB+p5gtckh
 apCZP9M3Wy0iT0lVwR+L0gmqDSAOzn49bOJVUh6Yr1fFJa/JZcPLU3XJfqn55alFa1hjIDccSnE
 7a7qWWJs4cJqm6f0QJGYLzbTgXVs7+J3fZYtrjVdPtoDWnSlmiXak3HK8UXCMtavDxpcuEAAcle
 pkWsyCNgS4YCW6neCFO9wWV4f3RqwN68hV3mQJE+5KxCs50FQqD46BTxUc8Ds0ulHozOILnUq90
 Fo9oQyGs8HoubJXlvZDOHxKtAX4kUSk+7dT1k7
X-Google-Smtp-Source: AGHT+IHyQaB2TR8KUea3SwwlIMzHSwtllB9aJOT/IlmVcHuuN2dZk3FyzfHO6W+DjewnRiM05QQM9g==
X-Received: by 2002:a17:903:1a6b:b0:24b:24dc:91a7 with SMTP id
 d9443c01a7336-2a3ee4b22d5mr142288635ad.45.1768170313100; 
 Sun, 11 Jan 2026 14:25:13 -0800 (PST)
Received: from [172.23.81.179] ([202.86.209.61])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c5ce06sm153925935ad.44.2026.01.11.14.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jan 2026 14:25:12 -0800 (PST)
Message-ID: <6b6eca04-376b-4601-8049-0f4f4282215e@linaro.org>
Date: Mon, 12 Jan 2026 09:25:04 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/24] util: don't skip error prefixes when QMP is
 active
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 devel@lists.libvirt.org, qemu-block@nongnu.org, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>
References: <20260108170338.2693853-1-berrange@redhat.com>
 <20260108170338.2693853-17-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260108170338.2693853-17-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On 1/9/26 04:03, Daniel P. Berrangé wrote:
> The vreport() function will print to HMP if available, otherwise
> to stderr. In the event that vreport() is called during execution
> of a QMP command, it will print to stderr, but mistakenly omit the
> message prefixes (timestamp, guest name, program name).
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   util/error-report.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

