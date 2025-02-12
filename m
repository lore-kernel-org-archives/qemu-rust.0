Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ti7Ox-00008U-3y
	for mharc-qemu-rust@gnu.org; Wed, 12 Feb 2025 02:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ti7Ov-00007s-IL
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 02:43:17 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ti7Ot-0007qU-M3
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 02:43:17 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43934d6b155so3028955e9.1
 for <qemu-rust@nongnu.org>; Tue, 11 Feb 2025 23:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739346193; x=1739950993; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3a9fIsye4pd6WhsqlD+ZRv9wRTNkS1SmwooMPJWiJ3E=;
 b=vbuFxeZHUXIXV1GDoFnAPY5yGQ8osSTd1bBeudtDL1L+S71enLtRzqMKsYjB772sl1
 OpWxmpOR+Jc0KBY4gXjxbftgjv1N51ePh7GqmUPVzTvgyHV3KV4NoCee3XAD71nCu/2W
 Lgtr5m2qFJGApPpCBaMR7gG+CO6zSuLuobHbQU88ymTqrrmasFLtuPjn/E4kQs228EH3
 8oPnMyklviS6aVUnm/5+p4vX01EYkBQjgCaX0/ipCehtGIRrwH2S0x38a1PaWQOQp8yN
 Gh0Qb0XMerf9Jm910bDx9jWGUZoTNhqfF5C8YPvBGZj3CICQUPFflj6DbpgofcZ+c5Y5
 O9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739346193; x=1739950993;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3a9fIsye4pd6WhsqlD+ZRv9wRTNkS1SmwooMPJWiJ3E=;
 b=XagZn5CfQGwhRUWV3eFCpqKa8Ln8t8OC5HtjmOREVrjROHx6PuDPKC8VVPq/ZWqPgA
 xdEziC4uHovQGR0XbSwIs2rce2XvmpHsS312vQwdtMTBgWoVwi8PhiqyHSb1033kOPxV
 O1zVZT1Ya/WbtpFt+AOyrLn91xxulVVPLAh0vFmBuXtOFQb6eJnxO9WFgxs+LOhM+ntc
 Lguu5VK+Acuo8G8pd3gyeokvSWMwhjRt/3ZhtWjUwCkepjlJdDKPfDIdn7Ya+6fRVi/d
 ER7T3jCRzhZa/hoopYGghVF0LUYLViQFKDl6G1MKdwxA57k/myAUETNT+ydA6BMGkrSZ
 /j5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhO/XUUD+xQsXEpv8aZCX1lTX6ks+c5tkwm9LE55Jfzr8aw9x7dQkRdeuNQEJ2M1YRYIRMSEUReVg=@nongnu.org
X-Gm-Message-State: AOJu0YzhpXyVwuRfScnBy5tv/QDJ+/k5y35C5aAnn0mYf+6MMTknGPuq
 w4XGWoRofTLvscGmuW844dNTTIdkqJO/A7Olgvs4leclRkYLfj1xPgKyO/Ku0IE=
X-Gm-Gg: ASbGncu17uryvGJ1RLE/3fbT5Orhl2M1rU+ILcjP0E4MRfzy5ynIkzpKCjXSrmOAY2i
 8h2SG7uqfXRWusUOSYi0jk5HErymI7NAU8F+JIgjCjGULpe/HXb3oC6jJ4Mn+IpIGHOvZD0oM+W
 9V6Xb8UkUzYYMJDYqpJf+tnW8jXDTufLLVbJTBLdVMOqr+k6zSZUx5j6JsRIFg9UPEGVfdX+7e9
 NOfswTCJYp6APyQ9yHCNwbZ/hdAI6TAXB8hrEI6acsf7RwbBW6PhCjllD3FrkN68OmsW85X3Jx2
 GxO7YLACxXjambWZ2lt6YiYi2hAhy+ZeTH/sgQzIihXLSgRo9uCsXf+K0QA=
X-Google-Smtp-Source: AGHT+IFybKtcEJ+o50hvyRapskh+z/+SoQTb5A8KWeKjjgTHN1zhLv0x1AcOKls/P4mfwizT8CGpmw==
X-Received: by 2002:a05:600c:4f83:b0:434:f3d8:62db with SMTP id
 5b1f17b1804b1-4395839dc90mr15094765e9.2.1739346193040; 
 Tue, 11 Feb 2025 23:43:13 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f8a2sm11323465e9.2.2025.02.11.23.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 23:43:12 -0800 (PST)
Message-ID: <1c08360a-ba01-4bca-8b31-e073ffe30256@linaro.org>
Date: Wed, 12 Feb 2025 08:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] block: Add bdrv_open_blockdev_ref_file()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, pbonzini@redhat.com, manos.pitsidianakis@linaro.org,
 qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250211214328.640374-1-kwolf@redhat.com>
 <20250211214328.640374-8-kwolf@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250211214328.640374-8-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Wed, 12 Feb 2025 07:43:17 -0000

On 11/2/25 22:43, Kevin Wolf wrote:
> This is the equivalent of bdrv_open_file_child() to be used in cases
> where the caller is QAPI based and has a BlockdevRef rather than a
> filename and an options QDict.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   include/block/block-global-state.h |  4 ++++
>   block.c                            | 30 +++++++++++++++++++++++++++---
>   2 files changed, 31 insertions(+), 3 deletions(-)


> +BlockDriverState *bdrv_open_blockdev_ref_file(BlockdevRef *ref,
> +                                              BlockDriverState *parent,
> +                                              Error **errp)
> +{
> +    BdrvChildRole role;
> +
> +    /* commit_top and mirror_top don't use this function */
> +    assert(!parent->drv->filtered_child_is_backing);
> +    role = parent->drv->is_filter ?
> +        (BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY) : BDRV_CHILD_IMAGE;

Nitpicking style:

        role = parent->drv->is_filter
               ? (BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY)
               : BDRV_CHILD_IMAGE;

> +    return bdrv_open_blockdev_ref_common(ref, parent, &child_of_bds, role,
> +                                         true, errp);
> +}


