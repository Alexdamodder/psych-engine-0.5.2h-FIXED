--botPlayOn = false

local stopAnimTimer = 0;
local targetTime = 0;
function onCreate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Pinkie Sing' then
                if difficulty == 2 then
                setPropertyFromGroup('unspawnNotes', i, 'texture', 'pNotes2'); --Change texture          
                else
                setPropertyFromGroup('unspawnNotes', i, 'texture', 'pNotes2i'); --Change texture  
                end
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); --Stops original animations

            if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
                --setPropertyFromGroup('unspawnNotes', i, 'hitByOpponent', true); --Miss has no penalties
                if not difficulty == 2 then
                setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
                end
            end
        end
    end

    if getProperty('cpuControlled') == true then
    botPlayOn = true;
    else
    botPlayOn = false;
    end
end

--if difficulty == 2 then

    function opponentNoteHit(id, direction, noteType, isSustainNote)
        if difficulty == 2 then
            if noteType == 'Pinkie Sing' then
                anim = ''
                if direction == 0 then
                    anim = 'singLEFT'
                elseif direction == 1 then
                    anim = 'singDOWN'
                elseif direction == 2 then
                    anim = 'singUP'
                elseif direction == 3 then
                    anim = 'singRIGHT'
                end
                --characterPlayAnim('bf', anim, true);
                triggerEvent('Play Animation', anim, 'bf');
            end
        end
    end

    function goodNoteHit(id, direction, noteType, isSustainNote)
        if difficulty == 2 then
            if noteType == 'Pinkie Sing' then
                anim = ''
                if direction == 0 then
                    anim = 'singLEFT'
                elseif direction == 1 then
                    anim = 'singDOWN'
                elseif direction == 2 then
                    anim = 'singUP'
                elseif direction == 3 then
                    anim = 'singRIGHT'
                end
                --characterPlayAnim('bf', anim, true);
                triggerEvent('Play Animation', anim, 'bf');
            end
        end
    end
--end

function onUpdatePost(elapsed)
	setProperty('bf.specialAnim',true)
    --if not difficulty == 2 then
    
        elapsedd = 0.016/elapsed
        for i=0, getProperty('notes.length') do

            if getSongPosition() > getPropertyFromGroup('notes',i,'strumTime') and getPropertyFromGroup('notes',i,'noteType') == 'Pinkie Sing' then --or getSongPosition() > getPropertyFromGroup('notes',i,'strumTime') and getPropertyFromGroup('notes',i,'noteType') == 'bf Sing Alt' then

               
                noteData = getPropertyFromGroup('notes',i,'noteData')
                                    anim = ''
                                    if noteData == 0 then
                                            --characterPlayAnim('bf', 'singLEFT' .. altP, true);
                                            
                                                anim = 'singLEFT'
                                            
                                        
                                    elseif noteData == 1 then
                                            
                                                anim = 'singDOWN'
                                            
                                            --characterPlayAnim('bf', 'singDOWN' .. altP, true);
                                    elseif noteData == 2 then
                                            
                                                anim = 'singUP'
                                            
                                            --characterPlayAnim('bf', 'singUP' .. altP, true);
                                    elseif noteData == 3 then
                                            
                                                anim = 'singRIGHT'
                                            
                                            --characterPlayAnim('bf', 'singRIGHT' .. altP, true);
                                    end
                                    triggerEvent('Play Animation', anim, 'bf');
                                    --characterPlayAnim('bf', anim, true);
                                    --runTimer('gotoidle',0.001*stepCrochet*6)
                                --if not difficulty == 2 then
                                removeFromGroup('notes', i);
                                --end
                                
                                

            end

    
        end
    --end
end


function onTimerCompleted(t,l,ll)
if t == 'gotoidle' then
	--setProperty('bf.stunned',false)
characterPlayAnim('bf', 'idle');
debugPrint('gaboobs')
end


end


