Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA02FCAC5BE
	for <qemu-rust@archiver.kernel.org>; Tue, 30 Sep 2025 08:04:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3VJX-0006Vo-E3; Tue, 30 Sep 2025 04:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3VI5-0005Sg-Pj
 for qemu-rust@nongnu.org; Tue, 30 Sep 2025 04:00:55 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3VHs-0000rf-9P
 for qemu-rust@nongnu.org; Tue, 30 Sep 2025 04:00:52 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ee15505cdeso4351160f8f.0
 for <qemu-rust@nongnu.org>; Tue, 30 Sep 2025 01:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759219233; x=1759824033; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qQCDKdcXs3mVaLepnz+ss4TJuz/AP/r/Ob1RAeTW8yM=;
 b=SHR0ywMmbxCar+o2oEEBE2Yk4P6095Mq+SBUYWeMxwnM7rsodOCSYKb09UjaKM3Jwa
 /3FsY3zYLjMjzz193IqDqZT2/QU28py4Bco8SbLXPqVBhmggrBkeHxBv25X5rwS/OSZb
 cU4TmPDeRQ3OC53HjH7L1/fvfSAbiSEspHpG5v5xhtIY0JT1xUVgjJogULHMnDbgFmic
 Q1tWLessOAENjm+o6AvsU4mDp3rNDUY3NviFj+DjGUjCzD433lPkfXVQcfpt7VHHvut1
 ng9fktP3Ryu4f0IK8IKOUzFOlrS1bHt5jcEBwkrjHdhTqZQ9dv+oojlmYY0Z2QHn+mXo
 Iscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759219233; x=1759824033;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qQCDKdcXs3mVaLepnz+ss4TJuz/AP/r/Ob1RAeTW8yM=;
 b=bApVWS/pIUd6l8R0IDDhm/amF7siRukpVr+vs5l6U3YWdbk5LgMgQMcnflQKtUo/rw
 2vnbLv2JpDxj3R9+Ynkcjtho5Txmsk8lcNQxROB8a5K2r2TO5Sfge2zTy68JKYeDdI1S
 p9VfYP+znW+fmVZUP/zacsWSsCXk0fOr2plX8nBGZaPfZedYnxY4nbsPKWmKY2OS8e4S
 c01nYnVa52XAEvPX6GLmZpphC9gOQKvCN2GtLFzIe/KipwhxBMMxpikkIzEDFZ5abSIg
 kvlkBFxsKxqQ6VNV0cEqr0m4gv3128emJKDiEf5FTtKuBNInbxTI/zQG/kAUl9SCOi8z
 EmZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVx8TwP4qoxnw5byCGS/tPlYZJHzlfEEiVhX+WI/aFX0DJWlYZMZcMaUo9kDw9wnGmHo/boWprt9Q=@nongnu.org
X-Gm-Message-State: AOJu0Yx1ZC9ZcNmYRJmTneck+C5vgZMwIL4yGM6jc6LgtT/740rANFTo
 O+lK+JVsrNPCEeI/ElbyE1n0Bh03EWsRqdcUpbdP8Zn0wJY927HsSPgO1rDnVfZHB+U=
X-Gm-Gg: ASbGncu6tMz9LnnRabpwKOkrMNXa/VuUr53myeFayAesLQMz405bH78nvm5WeXFNAz/
 vEWNrWfeoDPv13PaUV2g6mJNWiJsSXxPmk9utsri5EaoTAIfjz8gruromfbHTriZAWfk0SwTKy1
 DLQ3m65o10aQg72W254Ij8MQXQw3UvapsywMcMLEmyNHVXHnUNLkho2Rmh4s2wmYz8hywm+ap8y
 pnN/H3j4qUMGSaRilQ656znYG1aX6zg/Xl2Y1X0gqoTNyNi9Zjk7xpWblpfaWBDnfCx6caLXOYf
 rwLwxpWN8vr9U/PqLC895kd8cQHAuHUOkM7Bdd3kqWnfqMPrd2YI/Eyoyemh3AawBtEKjqhgqLq
 oOTdTOVcnOgVy0eBGsE3/vx/xxq/kbPUP93DMP8roKdQifKEK3zOZPSAdrbHuxvFdVgHlj12N9b
 dJpBik/U8Zk9UDs3Oy9fcLJXsL7VByoR9oL50=
X-Google-Smtp-Source: AGHT+IFoppn58DEl50aWpaOnqx/cEm3HRbP67s70C/Ucry1yukNCbcikDdo8azKuJ8QMPZm29sNPqQ==
X-Received: by 2002:a5d:588a:0:b0:3df:22a3:d240 with SMTP id
 ffacd0b85a97d-4240f26169cmr2998754f8f.4.1759219231360; 
 Tue, 30 Sep 2025 01:00:31 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb74e46bcsm21680470f8f.8.2025.09.30.01.00.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 01:00:30 -0700 (PDT)
Message-ID: <94426ef4-cbb6-4d3f-b0b0-e876e020110e@linaro.org>
Date: Tue, 30 Sep 2025 10:00:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] subprojects: Update .gitignore for syn
Content-Language: en-US
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
References: <20250930075351.1853721-1-zhao1.liu@intel.com>
 <675a6965-7c32-4b4d-8d27-88acac0c440d@linaro.org>
 <aNuSUHztLSchfd0o@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <aNuSUHztLSchfd0o@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 30/9/25 10:18, Zhao Liu wrote:
> On Tue, Sep 30, 2025 at 09:50:24AM +0200, Philippe Mathieu-Daudé wrote:
>> Date: Tue, 30 Sep 2025 09:50:24 +0200
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Subject: Re: [PATCH] subprojects: Update .gitignore for syn
>>
>> On 30/9/25 09:53, Zhao Liu wrote:
>>> The commit a530a8d4ac39 missed to update syn version, this is because
>>> the code base of its v2 patch has fixed syn version, so that the fix for
>>> syn were lost during the rebase from v1 to v2.
>>>
>>> To rectify this mistake, update the syn version.
>>>
>>> Fixes: a530a8d4ac39 ("subprojects: Update .gitignore for proc-macro2 and syn")
>>
>> IIUC the subprojects is in commit 9a6d6ae8afb, so:
>>
>> Fixes: 9a6d6ae8afb ("subprojects: update proc-macro2 and syn")
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> It's because the subject of a530a8d4ac39 mentioned to fix syn but it
> actually didn't :-).

Commit a530a8d4ac39 mentions "update", not "fix".

The 'Fixes:' tag is helpful for downstream forks, to cherry-pick
relevant commits.

> 
> Fixes tag for 9a6d6ae8afb is also fine for me.
> 
> Thanks!
> 
> -Zhao
> 


