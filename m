Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3D5E9B24D
	for <qemu-rust@archiver.kernel.org>; Tue, 24 Feb 2026 10:36:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vupla-0002T1-Ct; Tue, 24 Feb 2026 05:35:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vuplY-0002Rs-EP
 for qemu-rust@nongnu.org; Tue, 24 Feb 2026 05:35:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vuplV-0001S7-6M
 for qemu-rust@nongnu.org; Tue, 24 Feb 2026 05:35:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771929336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xqFJfQHPbulPlJYBrN55uvOiR5BILMKoAp+8A07i238=;
 b=UAK6x+sRpuKzzz+WJc3mi/kiVzaIiWnHk5odGxshbqbCUSNowosBPVccmO96AWtSduCdhr
 RMcnA3AY2PIcjl7SYRjUInJjEwCAv7sD4Rlqj0XRSDwgvWlnRzbNBqp3vEq1E87OY+A6cL
 66zRmDl/GNEh5mkk50gzZxFXrlSdiAY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-E7voywIMPKGI2eRLpxH2eA-1; Tue, 24 Feb 2026 05:35:34 -0500
X-MC-Unique: E7voywIMPKGI2eRLpxH2eA-1
X-Mimecast-MFC-AGG-ID: E7voywIMPKGI2eRLpxH2eA_1771929334
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-65f7356f1b3so187023a12.2
 for <qemu-rust@nongnu.org>; Tue, 24 Feb 2026 02:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771929333; x=1772534133;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xqFJfQHPbulPlJYBrN55uvOiR5BILMKoAp+8A07i238=;
 b=RJ6/KEH1x1rK9vxFVU52FeXHH7DD59OcIrh+hvh4ZV/uXF5oAU189AmJowbcehFC3w
 fuf03dDwtPbB3/qzRQbg1ROhFLT1BSjike8y2p2Pg+J9O0IU2aHxp3dQbVh4YOXWDgu6
 mIbg1D/HbkcYZbPL5bqAo4WXtDbBXuj799zVQPyoZs9yacn0kQYrZedfehuwqSEWf+yS
 YhFw/8SAap5uieDb9yFldhCU4uxoBY/f82TKSEeYkPw3KJ70VwEUxn/av7/88LhpMe1R
 WO8xS+JWO1fuvitvk+eRE2RzqlvdpaK03dgoTnWcBc/XSHz1nuVcT5G4i1T9gUg7IJ1I
 s5Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD4Jh/4GqV0vVqy/iWJ6iCsC0npv3ijTsWJH709+OlPjLlfxAqRimvyMXbjsF8WTqC0Wx1rZYFSu0=@nongnu.org
X-Gm-Message-State: AOJu0YxT1WKISyVkNcHIajAejomATK7flSLpGwvVvdZ01LNUno/uOhFN
 dGO1X9Gv8XV8/rn4EEWVqDjJgjAtDYRkmUA/HBVq0tCKvPpiIuGe6EhVHifIA9saxVQJoz5qoXD
 IYCQEQfTQeBG2uSA23UhfB6HVOcDLpXCLHz3hFONGzHpeR0qbW14aGSY=
X-Gm-Gg: ATEYQzx8JPMJf7UnYAx6bL/WTSReWl3FfMAtEpI0W02ofsTs6brT4+xfQCPIY/4GfBL
 v8iBO0ru4w8Jmk81EV/ie6TmHKiaERtUUKMoWImyPA1xR4cOw/afmssoc1QkSU08fLWnSJNKukB
 qeNlCoaQFspcihFe0g8ExEAaP8Cq0I5H7ANrrra+wLmG4GcUm8QzX0tDuJ5CVkkzfFrEaFHOj35
 3XMcNqt10iJBSn3yEGeLcnwoToO2aI9/c+haUK8kBREhfb3Yap7UMBzOnX93atdxaa+ikYxGla5
 /d0qEiZqLcY1ErisaBoR8YeFPYrG8VuQq+JA3YllChYAcANWkfhVIyGypNbVYiZTdtgrGRO48UG
 kALQQ0ZpP20NRV37TSlaLe2dR6vek09rG6aiuQIXYtLdfUtX9v52YFqKQZDEL4vnNAK+FOOzsuZ
 Md0uNJXxAJZCmDSPnvhkDqILL9CzM=
X-Received: by 2002:a05:6402:3645:b0:659:405b:547c with SMTP id
 4fb4d7f45d1cf-65ea4ef7b1dmr4804843a12.19.1771929333582; 
 Tue, 24 Feb 2026 02:35:33 -0800 (PST)
X-Received: by 2002:a05:6402:3645:b0:659:405b:547c with SMTP id
 4fb4d7f45d1cf-65ea4ef7b1dmr4804831a12.19.1771929333122; 
 Tue, 24 Feb 2026 02:35:33 -0800 (PST)
Received: from [192.168.10.81] ([151.95.144.138])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-65eab9a08edsm3327454a12.5.2026.02.24.02.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 02:35:32 -0800 (PST)
Message-ID: <58720d10-5613-4235-b47f-939e9a8d3096@redhat.com>
Date: Tue, 24 Feb 2026 11:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] rust/qobject: add basic bindings
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, qemu-rust@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
References: <20260108131043.490084-1-pbonzini@redhat.com>
 <20260108131043.490084-2-pbonzini@redhat.com> <87jyw24fw5.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87jyw24fw5.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nvuyg_JEpOMTmUL12wZqkjID_Mec6liokHrWcLrBIVM_1771929334
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=1.179, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.717,
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

On 2/24/26 11:03, Markus Armbruster wrote:
>> diff --git a/rust/util/wrapper.h b/rust/util/wrapper.h
>> index b9ed68a01d8..0907dd59142 100644
>> --- a/rust/util/wrapper.h
>> +++ b/rust/util/wrapper.h
>> @@ -30,3 +30,10 @@ typedef enum memory_order {
>>   #include "qemu/log.h"
>>   #include "qemu/module.h"
>>   #include "qemu/timer.h"
>> +#include "qobject/qnull.h"
>> +#include "qobject/qbool.h"
>> +#include "qobject/qnum.h"
>> +#include "qobject/qstring.h"
>> +#include "qobject/qobject.h"
>> +#include "qobject/qlist.h"
>> +#include "qobject/qdict.h"
> 
> Is this file just for bindgen, and never actually fed to the C compiler?

Yes.

>> +impl From<()> for QObject {
>> +    fn from(_null: ()) -> Self {
>> +        // Conversion of the C inline `qnull` function
>> +        unsafe { QObject::cloned_from_base(addr_of!(bindings::qnull_.base)) }
>> +    }
>> +}
> 
> Could we call C qnull() instead of using qnull_.base?

See v1 review - no, because qnull() is inline.  I can make it not 
inline, of course.

Paolo


