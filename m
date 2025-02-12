Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tiDA8-0001bT-Jq
	for mharc-qemu-rust@gnu.org; Wed, 12 Feb 2025 08:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiDA5-0001aZ-Ki
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 08:52:21 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiDA2-0004Bb-Se
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 08:52:21 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38dc73cc5acso603085f8f.0
 for <qemu-rust@nongnu.org>; Wed, 12 Feb 2025 05:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739368336; x=1739973136; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mDGElKK7O6ztUPks6RUd5Ce9zA7qI1BjY7ade2bOauY=;
 b=C3x0nWmWDl8aS7WW33xZ7StF07t/XgXkCocQcmP5clLnl2ofdDP26Je7dBfsIK4Lwd
 Jgz8nTAonugKSDqkPlfnjmnYzPOm4JaJBxMFuGFmdGdHNJab+02+sTk0KH9wn5QYAMU3
 KMNizQpmH+Uzjv7CK1aM/TK8Gug/Q3k2kQAVtc7ZYsOfQqcZQ5r+7CFfmR+Kq0oQDhjn
 t76yuNgnjaPaBwaEq4+YM25mfVawMlXBsXc1PlfnZe01o8JPMprcF6jYy0jdBtlZax/e
 SEZevAjl6ViAuUptEd6y0x+RphEnDLqVpdSUNZxe7LWB9mMzEPs22hglLYoD0qgvv4g7
 3Q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739368336; x=1739973136;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mDGElKK7O6ztUPks6RUd5Ce9zA7qI1BjY7ade2bOauY=;
 b=FqWzLNRzoG8gzHqOe0yk5zeH9h6N9zcnr6uvJh0uYWaG5fg2agCZkLyFLGiVBeF39D
 p6MT6NQL1gqcN4YoU+LOGTt7XR0g+Mep5kV7Ojg7JWstyk5XGi3PbNPJRVvSsNepy1Ez
 ZEDBwoamhDcASJOhiKAGgzFdaHuKFL7VpIMaZVPIitErkFB9T7zIqowWWYKbnHo0fLbZ
 0NQbDQZjajTAZeo0ojGzlTeWLRlOM8VsJAwbxZfzAsFCScYNTkCqQHVdOS9l9Am7CaVt
 t/BbRVzReXZU0JL1C2ULn0ZvANc3t7K0BbrXX44mxCkefipIQa8L2Qv5uUsBmRRUohfy
 s8/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu9qDuow38ikZsbUDZd/VFjMhPlOqoAyjtGWOQsNz8MU72jhXqsx1DFEtW0KtqknjdTHou8pUH8eE=@nongnu.org
X-Gm-Message-State: AOJu0YwqVGjXEO2dJpedTsXEOC8AacZnCDxQFOLleqEljXOjnApry86J
 Yx1LtCDiOTnWceUqZsdfyZ7RM+1L6G2dW4mLu8Boc4g8OuiTSz2V9STSVuEKd30=
X-Gm-Gg: ASbGncs7yv6iuosCbwuRVQZr0LfvIP5s85cOzG1k2UVgudcKyaENOiMKXO5kvbj7GR7
 5YxpRju2rPFSt9hqS4+4XiDWTI8MtxvqB34kaLaXXafgokvmMD35g7bKT3sFsn5EgmHj/RdyGm/
 F5AOXLp1hfZRcaYcwIGnyBTwaqHFBTTFO0qIUTDhyrmJxxIVIGrcnJ9yMxQWKyilLhOjdJ6pin9
 mGh+9ZxF+EBRY/47qfsd/x0SDZT2faTC8GufwaGsSYCUjDTubZ9nCJJivZJ9uuFVehGeiddmduU
 bnTtvDnz27pKDfdbeXbWTTOBeGY7BxNZEhG9K9at0rzuB0DbnvSjHuBeb7U=
X-Google-Smtp-Source: AGHT+IHwZFqqEYnmSu/nxYh/dqHKV3zekZCKJGDzP5NFgsKQmkY1cau9nHuSFsjlKIk7FFKXu3Pz1Q==
X-Received: by 2002:a05:6000:156c:b0:38d:c88e:d57b with SMTP id
 ffacd0b85a97d-38de43e921fmr7468669f8f.26.1739368336272; 
 Wed, 12 Feb 2025 05:52:16 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38deb34980esm1857133f8f.97.2025.02.12.05.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 05:52:15 -0800 (PST)
Message-ID: <7852ec2e-bc14-420e-a4bc-0230f3141980@linaro.org>
Date: Wed, 12 Feb 2025 14:52:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] bochs-rs: Add bochs block driver reimplementation
 in Rust
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, pbonzini@redhat.com,
 manos.pitsidianakis@linaro.org, qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250211214328.640374-1-kwolf@redhat.com>
 <20250211214328.640374-11-kwolf@redhat.com>
 <0e3d0835-c216-4f8c-8b97-e849ecb5ca47@linaro.org>
 <Z6ybQQRnmo8MljdY@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z6ybQQRnmo8MljdY@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-List-Received-Date: Wed, 12 Feb 2025 13:52:21 -0000

On 12/2/25 13:59, Kevin Wolf wrote:
> Am 12.02.2025 um 08:45 hat Philippe Mathieu-Daudé geschrieben:
>> On 11/2/25 22:43, Kevin Wolf wrote:
>>> This adds a separate block driver for the bochs image format called
>>> 'bochs-rs' so that for the moment both the C implementation and the Rust
>>> implementation can be present in the same build. The intention is to
>>> remove the C implementation eventually and rename this one into 'bochs'.
>>> This can only happen once Rust can be a hard build dependency for QEMU.
>>>
>>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>> ---
>>>    rust/block/Cargo.toml    |   2 +-
>>>    rust/block/src/bochs.rs  | 296 +++++++++++++++++++++++++++++++++++++++
>>>    rust/block/src/driver.rs |   5 -
>>>    rust/block/src/lib.rs    |   1 +
>>>    4 files changed, 298 insertions(+), 6 deletions(-)
>>>    create mode 100644 rust/block/src/bochs.rs
>>
>>
>>> diff --git a/rust/block/src/bochs.rs b/rust/block/src/bochs.rs
>>> new file mode 100644
>>> index 0000000000..388ac5ef03
>>> --- /dev/null
>>> +++ b/rust/block/src/bochs.rs
>>> @@ -0,0 +1,296 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Block driver for the various disk image formats used by Bochs
>>> + * Currently only for "growing" type in read-only mode
>>> + *
>>> + * Copyright (c) 2005 Alex Beregszaszi
>>> + * Copyright (c) 2024 Red Hat
>>> + *
>>> + * Authors:
>>> + *   Alex Beregszaszi
>>> + *   Kevin Wolf <kwolf@redhat.com>
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>>> + * of this software and associated documentation files (the "Software"), to deal
>>> + * in the Software without restriction, including without limitation the rights
>>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>>> + * copies of the Software, and to permit persons to whom the Software is
>>> + * furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>>> + * THE SOFTWARE.
>>> + */
>>
>> As an addition, we don't have to add the full license boilerplate IMO...
> 
> IANAL, but the license says "The above copyright notice and this
> permission notice shall be included in all copies or substantial
> portions of the Software.", so keeping it feels like the safe option.

OK (and as Daniel clarified, you consider your work a derivative).


