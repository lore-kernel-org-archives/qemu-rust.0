Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uHP8W-0006Eg-Un
	for mharc-qemu-rust@gnu.org; Tue, 20 May 2025 11:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uHP8R-0006Ce-AS
 for qemu-rust@nongnu.org; Tue, 20 May 2025 11:44:08 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uHP8O-0001eL-OG
 for qemu-rust@nongnu.org; Tue, 20 May 2025 11:44:06 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-70de22bdfaeso7591037b3.2
 for <qemu-rust@nongnu.org>; Tue, 20 May 2025 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747755843; x=1748360643; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hXwSPoCdFrnNBCDyn+um0sb/j3x3yb9Ru7xa/EvHcPI=;
 b=rpwkrcI5sMomTEBFUkSijqLHzu1F2qb3YGQMZUQ68b04fXciXeiKx18RqnJGAIrFNe
 YXSM3W364QfhzoeL4Ld753+TeuR14MSoHaBKixHZfYemtOYNklnCdQlwGo/33xyuMpOO
 X6mnwegzn2MgGIGW9Rq3pznJ5PEe6wxNDkfk3/LOYZyD9KcrXkGTmMXptdZYZb+t15ka
 MpNuRNlxyerwIYwmFIFjKSk+ILr3588+suLRt2u+U65nNoRCcw71o4vWbwK5BsaaUtYX
 XZw9B6XTf8BvBEatFd2uSiC88dTWkhSmgmbAwhhCjqxi2loeI6W2XZ9zUzFsgYjXCP7m
 6mOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747755843; x=1748360643;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hXwSPoCdFrnNBCDyn+um0sb/j3x3yb9Ru7xa/EvHcPI=;
 b=iIHWVCKwl3tsn6NIdnczm67nonf35gX8H0rJi+IusboVSDpHn95bHfuqUN13MxqMBz
 pP1+EEqtT2/fNT+8NToaowkaDOOeIh1Jhp9MmIAr8cayP4upA/FjYAy4ehKoAHWrQwDv
 DaL5Spm9TrSOCYtyH3mO87zctmUAC52Ku2xLW5YLjcOjO9RpgCjoPCk9aZSx6HWhOetU
 LlyrS/qggUEmIwfFSAsEjgibDA3YCJm3QAv4TS9XxvPWGWmcHSK1685MQc+8Pm/yD5ue
 PqsWtATsCPDZa5ZmrA4tjZGaJd5it9qwx0TMfWV8qAslwGAMQogL1djIs1/uqWNileh4
 /NLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr8ZpdMR/iIplfPCl1/nIy67YEE+77LSQzJnNhzxbzvtC62RR/W9Ydz9HFLza3OIXiKQxtvKkwd8c=@nongnu.org
X-Gm-Message-State: AOJu0YxwkuLkrBEyjDTtkbyzjznye96E7/vOul1J0LNG79coz5eMXnUW
 JtUorkjeO3CLsEOegNVjMj5D/fewwqsmSmSjJrYqH25xwAY7RB5BNQgIMLgV6fVewdFfwi/sT4H
 eRTFMciVF7ifnIQ03r//SveGz8kXw6RNnvx+y6bzv+w==
X-Gm-Gg: ASbGncvQA8urvFpV+6jedN3WQeupP7n7XeRv0G8yAzzH6dQz4jBKrIVbWiffyqPJFZL
 eCd6x5uB2Y3m6RM38xaFStBN01IZ33nikApngSsWIT8JtwUigY4vpNZWX5Dhdpjv8A7rfe+jUyW
 sPw9Esc911G53t8HG4wnXlut0LFSd7hy7urr0=
X-Google-Smtp-Source: AGHT+IH8iXeHhxnU+LzfBR2w0LfTMMP90X3xaqltyJQODtAdJk4d5ZhkRMAeS/fzUPJR1B87FL8u38McHc7iUoPqpns=
X-Received: by 2002:a05:690c:45c9:b0:6fd:a226:fb50 with SMTP id
 00721157ae682-70caaf72640mr245214227b3.13.1747755842932; Tue, 20 May 2025
 08:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152750.2542612-1-zhao1.liu@intel.com>
 <20250520152750.2542612-6-zhao1.liu@intel.com>
In-Reply-To: <20250520152750.2542612-6-zhao1.liu@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 May 2025 16:43:51 +0100
X-Gm-Features: AX0GCFsJ4swdr42Zpi6bNUDrfV6Dq-syz0rQiXAdQilDXhWsYEb2w2f0G04S2Vw
Message-ID: <CAFEAcA_48ZgY-aAcObASGc5VOzDDTRJcWaWLb9H2gB_tMQvZGw@mail.gmail.com>
Subject: Re: [PATCH 5/5] rust: Fix the typos in doc
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org, Dapeng Mi <dapeng1.mi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
X-List-Received-Date: Tue, 20 May 2025 15:44:10 -0000

On Tue, 20 May 2025 at 16:07, Zhao Liu <zhao1.liu@intel.com> wrote:
>
> These typos are found by "cargo spellcheck". Though it outputs a lot of
> noise and false positives, there still are some real typos.
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Note: But I have to admit, cargo spellcheck isn't a great tool.
>
> Picked from <20250218092108.3347963-1-zhao1.liu@intel.com> with checking
> again.
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

