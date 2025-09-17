Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208C0CA0EE8
	for <qemu-rust@archiver.kernel.org>; Wed, 17 Sep 2025 11:42:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uyqWf-0006LT-PZ; Wed, 17 Sep 2025 07:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uyqWW-00069i-PN
 for qemu-rust@nongnu.org; Wed, 17 Sep 2025 07:40:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uyqWU-00007T-9F
 for qemu-rust@nongnu.org; Wed, 17 Sep 2025 07:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758109229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fwVgncdj/Sqp7PFyxUTP95A9TG+s+P37rcpvxjB9Jz8=;
 b=hjx784K8m7Z3l6k0UGK/KJpmgrrmWf0+yUQErqqoB2NwImXyvKpJmTQfmDjO5yttqHktdj
 /qJrckdaMfsDORSOC/89hIzBxT26jvzq5UreldM91d0kDcLuJsoCREarGo+Eu+QSL5VbSL
 sFykS1+ZWbpQxDobim53Nl4LEvR41jk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-n0DHp4x8NA6K764fkj12-g-1; Wed, 17 Sep 2025 07:40:27 -0400
X-MC-Unique: n0DHp4x8NA6K764fkj12-g-1
X-Mimecast-MFC-AGG-ID: n0DHp4x8NA6K764fkj12-g_1758109226
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45b990eb77cso6656765e9.0
 for <qemu-rust@nongnu.org>; Wed, 17 Sep 2025 04:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758109226; x=1758714026;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fwVgncdj/Sqp7PFyxUTP95A9TG+s+P37rcpvxjB9Jz8=;
 b=XLSoC8GPvJmnZVVWfXJWhSHJqskb+HPqcFZrpY/NN7xf3P3F2Kh4a/jBqdvjEsCppH
 FTeLJgAuDgOsgRiQL9DxyGozHCHCXYdAh52GWxU/CEFvWVtfdE+4Fqa1XDVpQ723YpV8
 FR/SsJb1ybluPTlBdLFCLiJ/LkfqoJyxnUk5Bu27aZfvubX0qx+9QKFvqDBitrQ0sudd
 kf411ZSKl7I5KC+1C+nI/2nuzER1a6uiZmuui0M54rsJpZUZyWLfENoyoeOSvy+eJqth
 czFkK2yNh3hCfXCFJzu1z3W5xjP91yNRzS1DygyhMW75VqpVboDF5ogoZFln0/20Z5xR
 6C5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNADcYjYU7YsiPHqq7iVqqEye66a7seDZG7zeF+7D3cY2P4FKsJ8iGbDdtL3MAGsdnV/jKB6VWXIY=@nongnu.org
X-Gm-Message-State: AOJu0YwmKXP+Uce62VfLmHOg1027xfLqan9/ECso7jChzUaMRZkilq5W
 bzyiaHxblI9TTaSaupu22hAv8ny4AeiIII7PE1ODhNFpY5xjBIc1+VgI9UVMz7mjcdjUZ8Mf7RZ
 WdB+D90wJ3MqCcppocB9IobCPGZD/XKsVU4Y4wvbJ9LjiVMnTDEGbBSg=
X-Gm-Gg: ASbGncsWY2C0xhV7m8aX6xo1zRKllB8yhplYJ8WxgOtagwutndpnlP+amDKikTHBIPm
 xx7iM/srmaMHyqjR9o6ldLTzuBUJtgKIZ5PIb3kXoc1SnmP/FIKe5/VpxpLVsQ5KySHoVz/2UcB
 jnLPKGF/LnLi0VF70i1wIY4aV4U/tH02bc8YBj119qBaquVjge2Vfm3X++KMAZ2ejQTSqcUs4NW
 +YdM8p3xholY1Ig0jX6AdhfPNynmgOBjz8l0r/gCj4QoopoZsNV/69MiYu79N5pGbyPUcYK17bT
 ZQXPh/CSJdNwfzfzwzzdBBkEUsBW7CQD8lvs/rULdh1QdBNtVqQ5M+8YER2n+1QQ2GxezsnvUy4
 xHofGomS/050JU1ual9wTu0mOUbnIILNbdmIyQWswi3s=
X-Received: by 2002:a05:600c:46c6:b0:45d:dc10:a5ee with SMTP id
 5b1f17b1804b1-461f94aebebmr17108755e9.15.1758109226317; 
 Wed, 17 Sep 2025 04:40:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJYsUg5Jvx8FAD0w0tCwDk/n0wKWeDwUalFTocQeblTOfBMfMs83QARTlgiMe8F3aim222YQ==
X-Received: by 2002:a05:600c:46c6:b0:45d:dc10:a5ee with SMTP id
 5b1f17b1804b1-461f94aebebmr17108445e9.15.1758109225852; 
 Wed, 17 Sep 2025 04:40:25 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.56.250])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-46139ab391bsm34470325e9.21.2025.09.17.04.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 04:40:25 -0700 (PDT)
Message-ID: <30f278e0-b55d-4a25-9123-7e7735ad8b8c@redhat.com>
Date: Wed, 17 Sep 2025 13:40:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] rust/qdev: Support bit property in #property macro
To: Zhao Liu <zhao1.liu@intel.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250916085557.2008344-1-zhao1.liu@intel.com>
 <20250916085557.2008344-10-zhao1.liu@intel.com>
 <CAAjaMXYkJno=nAcAGPWQJMCjcSkePJwjmZgFkPAkX2N3tQoSCQ@mail.gmail.com>
 <aMpicpXtVu/4lK63@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <aMpicpXtVu/4lK63@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5jdqcFyZnpWhBGxtJx3Br40xdI42itOjj9oCGeF2oZY_1758109226
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/17/25 09:25, Zhao Liu wrote:
> Only 3 types supports bit:
> 
> u32: qdev_prop_bit
> u64: qdev_prop_bit64
> OnOffAuto: qdev_prop_on_off_auto_bit64 (not support yet)

Yes, this one needs to wait for QAPI (unless we move OnOffAuto to core 
code).

> So for other types don't support bit, they need default BIT_INFO item,
> otherwise, we will meet the error:
> 
>   not all trait items implemented, missing: `BIT_INFO`
> 
> And this panic can provide richer info about why a type can't support
> bit property. (I just refer the implementation of `trait VMState`).

Yep, looks good. I added to rust-next a couple patches that you can 
rebase on, to use the attrs crate.

Also please add a testcase.

Paolo


