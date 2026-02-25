Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20E9EFD206
	for <qemu-rust@archiver.kernel.org>; Wed, 25 Feb 2026 08:05:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vv9ti-0005lJ-79; Wed, 25 Feb 2026 03:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vv9tg-0005gl-5I
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 03:05:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vv9te-0000su-DA
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 03:05:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772006725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Ikyzkts721L5JCueYlPHhLJIrBzi/Gft4KsIokRrZY=;
 b=jGTSMDs61A37vXsX+DvAuG9xq2X6gZ7izzEumHuaOhmWOl6pZxYkLO9xt2UO/vgMkbbUAp
 zm/nCL3TMNQYrothV5Chzc1iAKQTVqbbUGjLPIwDDDK9qJ+FVOIdGFA11IpX3W3KseTmdv
 x5Udv0QxwxiM8Eos0L3dJPlhSWtIw9c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-eqxKZk-JNjy3QglRFDhnAg-1; Wed, 25 Feb 2026 03:05:23 -0500
X-MC-Unique: eqxKZk-JNjy3QglRFDhnAg-1
X-Mimecast-MFC-AGG-ID: eqxKZk-JNjy3QglRFDhnAg_1772006723
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4836bf1a920so63833545e9.3
 for <qemu-rust@nongnu.org>; Wed, 25 Feb 2026 00:05:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772006723; x=1772611523;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Ikyzkts721L5JCueYlPHhLJIrBzi/Gft4KsIokRrZY=;
 b=De95x/pAYMBhiXA7aDfIhnsvZJArQWQyaO0JvMtTyI9NN0dPqlppo6S7IDZGIilmmR
 X6+08Ptz4SxWY8KRMPEQnc7dxxMRbaoHdxzk6cssFu0IjE+xaLcHe7Ia0Dkg8VLtMJpS
 cLa0lXvdleS0rQhTkV4I/ToFsxlhc3UV0y5bjb7f448CnZ8IVLgXdhoRAs0b1q1Ub23D
 Ve2F0vX8ROwNIpQZVSZLbBwSL459c/w20HlnE/0wIi6Dxc7CIR1mL5JnkW1UWI91LFQz
 UyOI+r9hOBvkwRl7s+76hgnWO5dBsleEvDTb6DNLHQUhOQqCb4j3jhHv/Cww0frNtvQM
 DF6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzgMkr1lipPzD0rscscGaPfYfAQqnuq5SWQlQjR21S5dqzpV6OlFhf72ZSM9aNedXohiq54OHPqp4=@nongnu.org
X-Gm-Message-State: AOJu0YydS8jZc7iqfn/zCkDLOb92md8v5GW7SyZo1eJLsqV/v1EnQPpg
 H/LVyoegzsSHuvql5TbX+nGuiJQxeHjeH6v+vklM5jtqeIEx1rXsUPk3CEBmxAxC95O7Aw2g5qB
 RPZJwmi8wFIUid0eIHU6o93vJCJ6DL13R9pf0V+YLsZNzSLXiNBbG5/Y=
X-Gm-Gg: ATEYQzz7z+1PjtCgdz94FsU+x6XzyxT7DSkHPX6zXZpCVc0Z8A5+CDb97e0qQdZ4rOR
 zSv82cPwInxeNJaHgya7hSZnTMfhqBmOAYyqAf0G81f0fGIZLFhjVtOw0IlaJTh4mzwNwbIMsSv
 GxXnVs0318Jl2piG+KUpYoF3szLUkhf54WZnCHkLtSaL6i5C4BOLtTCPCKDoBd61IbD6lKFuP3k
 GZlrFTFJr1nsYFqAc5REvngU6yhJLYNE9DGxusYvqXe4JxQlBEK1P5zkBeEWo2JkH1FtmaM1zFn
 SobfNp017miKG4NBTtokQ0ry7BcHGxUkXZjhz5dAaF6l1QT8uSPhTwe96llPn63cI3qtZ84ko75
 WN3IqBFIaN6fHTnJBxBFlQKTDs1jWiMn7wYe1kxfdMP9dl0qjYO8A5PEgsTn5APB+uAhFRH7P6r
 lmcNWkCpNm4AlOY7UqyS8eGj6FhXk=
X-Received: by 2002:a05:600c:5289:b0:480:1b65:b744 with SMTP id
 5b1f17b1804b1-483bef5c44fmr23389825e9.28.1772006722610; 
 Wed, 25 Feb 2026 00:05:22 -0800 (PST)
X-Received: by 2002:a05:600c:5289:b0:480:1b65:b744 with SMTP id
 5b1f17b1804b1-483bef5c44fmr23389235e9.28.1772006722035; 
 Wed, 25 Feb 2026 00:05:22 -0800 (PST)
Received: from [192.168.10.81] ([151.95.144.138])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-483bfb296bfsm8894595e9.0.2026.02.25.00.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 00:05:21 -0800 (PST)
Message-ID: <e88e3a0f-6b15-4967-8e9c-613ecf537b5e@redhat.com>
Date: Wed, 25 Feb 2026 09:05:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] rust/qobject: add basic bindings
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, qemu-rust@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
References: <20260108131043.490084-1-pbonzini@redhat.com>
 <20260108131043.490084-2-pbonzini@redhat.com> <87jyw24fw5.fsf@pond.sub.org>
 <58720d10-5613-4235-b47f-939e9a8d3096@redhat.com>
 <87y0ki1d21.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87y0ki1d21.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z2_2ZXPuzKuvJtiFxH3sZeJ12BZWUKr8z1IgaZVf9zY_1772006723
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.358, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.659,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2/24/26 14:33, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 2/24/26 11:03, Markus Armbruster wrote:
>>>> diff --git a/rust/util/wrapper.h b/rust/util/wrapper.h
>>>> index b9ed68a01d8..0907dd59142 100644
>>>> --- a/rust/util/wrapper.h
>>>> +++ b/rust/util/wrapper.h
>>>> @@ -30,3 +30,10 @@ typedef enum memory_order {
>>>>   #include "qemu/log.h"
>>>>   #include "qemu/module.h"
>>>>   #include "qemu/timer.h"
>>>> +#include "qobject/qnull.h"
>>>> +#include "qobject/qbool.h"
>>>> +#include "qobject/qnum.h"
>>>> +#include "qobject/qstring.h"
>>>> +#include "qobject/qobject.h"
>>>> +#include "qobject/qlist.h"
>>>> +#include "qobject/qdict.h"
>>>
>>> Is this file just for bindgen, and never actually fed to the C compiler?
>>
>> Yes.
> 
> Thanks!
> 
>>>> +impl From<()> for QObject {
>>>> +    fn from(_null: ()) -> Self {
>>>> +        // Conversion of the C inline `qnull` function
>>>> +        unsafe { QObject::cloned_from_base(addr_of!(bindings::qnull_.base)) }
>>>> +    }
>>>> +}
>>>
>>> Could we call C qnull() instead of using qnull_.base?
>>
>> See v1 review - no, because qnull() is inline.  I can make it not
>> inline, of course.
> 
> I feel making it inline was a bit silly.  Perhaps I had a non-silly
> reason back then, but I can't see it anymore.

Maybe it was, but qnull_ is also used by tests/unit/check-qnull.c; and 
it would also be silly to make qnull() extern while keeping the global 
qnull_.  In doubt, I'd leave it as is.

Paolo


